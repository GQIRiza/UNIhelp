import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:unihelp/models/work.dart';
import 'package:unihelp/services/get_disceplines.dart';
import 'package:unihelp/services/get_types.dart';
import 'package:unihelp/services/get_unis.dart';
import 'package:unihelp/services/get_works.dart';

class ListWorksByFilterPage extends StatefulWidget {
  final String? selectedUni;
  final String? selectedDiscipline;
  final String? selectedType;

  const ListWorksByFilterPage({
    Key? key,
    this.selectedUni,
    this.selectedDiscipline,
    this.selectedType,
  }) : super(key: key);

  @override
  _ListWorksByFilterPageState createState() => _ListWorksByFilterPageState();
}

class _ListWorksByFilterPageState extends State<ListWorksByFilterPage> {
  late List<Work> works = [];
  late List<Uni> unis = [];
  late List<Discipline> disciplines = [];
  late List<TypeOfWork> types = [];

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    List<Uni> unis = await getUnis();
    List<Discipline> disciplines = await getDisciplines();
    List<TypeOfWork> types = await getTypes();
    setState(() {
      this.unis = unis;
      this.disciplines = disciplines;
      this.types = types;
    });

    getWorks(
      selectedUni: widget.selectedUni,
      selectedDiscipline: widget.selectedDiscipline,
      selectedType: widget.selectedType,
    );
  }

  Future<void> getWorks(
      {String? selectedUni,
      String? selectedDiscipline,
      String? selectedType}) async {
    List<Work> filteredWorks = await getWorksByFilters(
      selectedUni: selectedUni,
      selectedDiscipline: selectedDiscipline,
      selectedType: selectedType,
    );
    setState(() {
      works = filteredWorks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDisciplineObj = disciplines.firstWhereOrNull(
        (discipline) => discipline.id == widget.selectedDiscipline);
    final selectedTypeObj =
        types.firstWhereOrNull((type) => type.id == widget.selectedType);
    final selectedUniObj =
        unis.firstWhereOrNull((uni) => uni.id == widget.selectedUni);

    String appBarTitle = '';
    if (widget.selectedType != null) {
      appBarTitle = selectedTypeObj?.title ?? '';
    } else if (widget.selectedDiscipline != null) {
      appBarTitle = selectedDisciplineObj?.title ?? '';
    } else if (widget.selectedUni != null) {
      appBarTitle = selectedUniObj?.title ?? '';
    } else {
      appBarTitle = 'Общий заголовок';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          appBarTitle,
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
            if (widget.selectedType != null) {
              BlocProvider.of<ApiBloc>(context).add(TypesEvent());
            } else if (widget.selectedDiscipline != null) {
              BlocProvider.of<ApiBloc>(context).add(DisciplinesEvent());
            } else if (widget.selectedUni != null) {
              BlocProvider.of<ApiBloc>(context).add(UnisEvent());
            }
          },
        ),
        // Остальные параметры AppBar
      ),
      body: SafeArea(
        child: works.isEmpty
            ? Center(child: CircularProgressIndicator()) // Отображение CircularProgressIndicator
            : ListView.builder(
          itemCount: works.length,
          itemBuilder: (context, index) {
            return buildWorkItem(works[index]);
          },
        ),
      ),
    );
  }

  Widget buildWorkItem(Work work) {
    Discipline selectedDisciplineObj = disciplines
        .where((discipline) => discipline.id == work.selectedDiscipline)
        .first;
    TypeOfWork selectedTypeObj =
        types.where((type) => type.id == work.selectedType).first;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        width: 370,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.indigo[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 56, 8),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // h7K (165:409)
                    margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Text(
                      '${selectedTypeObj.title} на тему: ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    work.workName,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 143, 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'Предмет:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '${selectedDisciplineObj.title}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 196, 0),
              width: double.infinity,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 19, 0),
                  child: Text(
                    '🕗',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Text(
                  DateFormat('dd.MM.yyyy')
                      .format(work.selectedDateTime.toDate())
                      .toString(),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

}
