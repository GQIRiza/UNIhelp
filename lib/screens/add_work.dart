import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:intl/intl.dart';
import 'package:unihelp/models/work.dart';
import 'package:unihelp/services/save_work.dart';
import 'package:uuid/uuid.dart';

class AddWorkPage extends StatefulWidget {
  final List<Uni> unis;
  final List<Discipline> disciplines;
  final List<TypeOfWork> types;

  const AddWorkPage(
      {Key? key,
      required this.unis,
      required this.disciplines,
      required this.types})
      : super(key: key);

  @override
  _AddWorkPageState createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  String? selectedDateTime;
  String? selectedUni;
  String? selectedDiscipline;
  String? selectedType;
  late TextEditingController workNameController = TextEditingController();
  late TextEditingController workDescriptionController =
      TextEditingController();
  late TextEditingController fileLinkController = TextEditingController();
  late TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    workNameController.dispose();
    workDescriptionController.dispose();
    fileLinkController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          "Создание задания",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            User user = FirebaseAuth.instance.currentUser!;
            BlocProvider.of<ApiBloc>(context).add(ProfileEvent(user.uid));
          },
        ),
        // Остальные параметры AppBar
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              add(),
              save(),
            ],
          ),
        ),
      ),
    );
  }


  Widget add() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.only(left: 20, bottom: 2, top: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            'Университет',
            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          )),
      SizedBox(
        width: 350,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Выберите университет',
          ),
          value: selectedUni,
          onChanged: (String? newValue) {
            setState(() {
              selectedUni = newValue;
            });
          },
          items: widget.unis.map((Uni uni) {
            return DropdownMenuItem<String>(
              value: uni.id,
              child: Text(uni.title),
            );
          }).toList(),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        width: 350,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Выберите предмет',
          ),
          value: selectedDiscipline,
          onChanged: (String? newValue) {
            setState(() {
              selectedDiscipline = newValue;
            });
          },
          items: widget.disciplines.map((Discipline discipline) {
            return DropdownMenuItem<String>(
              value: discipline.id,
              child: Text(discipline.title),
            );
          }).toList(),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        width: 350,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Выберите тип работы',
          ),
          value: selectedType,
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
          items: widget.types.map((TypeOfWork type) {
            return DropdownMenuItem<String>(
              value: type.id,
              child: Text(type.title),
            );
          }).toList(),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        width: 350,
        child: TextFormField(
          controller: workNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Введите название задания',
          ),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        width: 350,
        child: TextFormField(
          controller: workDescriptionController,
          maxLines: 7,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Подробно опишите свой вопрос',
          ),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        width: 350,
        child: TextFormField(
          controller: fileLinkController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Введите ссылку на файл',
          ),
        ),
      ),
      InkWell(
        onTap: () {
          dateTimePickerWidget(context);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20, bottom: 26, top: 8),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(Icons.add_circle_outlined,
                  size: 30, color: Colors.deepPurple),
              Text('  '),
              Text(
                selectedDateTime != null
                    ? 'Дата и время: $selectedDateTime'
                    : "Дата и время невыбранны",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget save() {
    return InkWell(
      onTap: () {
        String workName = workNameController.text;
        String workDescription = workDescriptionController.text;
        String fileLink = fileLinkController.text;
        DateTime selectedDateTimeObj =
            DateFormat('dd-MMM-yyyy - HH:mm').parse(selectedDateTime!);

        Timestamp selectedTimestamp = Timestamp.fromDate(selectedDateTimeObj);
        User user = FirebaseAuth.instance.currentUser!;
        String newId = Uuid().v4();
        Work work = Work(
          id: newId,
          workName: workName,
          workDescription: workDescription,
          fileLink: fileLink,
          selectedUni: selectedUni!,
          selectedDiscipline: selectedDiscipline!,
          selectedType: selectedType!,
          selectedDateTime: selectedTimestamp,
          userUid: user.uid,
        );
        saveWorkToFirestore(work);
        BlocProvider.of<ApiBloc>(context).add(ProfileEvent(user.uid));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 6),
        width: 200,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.indigo[200], borderRadius: BorderRadius.circular(20)),
        child: Text(
          'Сохранить',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd-MMM-yyyy - HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          selectedDateTime = DateFormat('dd-MMM-yyyy - HH:mm').format(dateTime);
        });
      },
    );
  }
}
