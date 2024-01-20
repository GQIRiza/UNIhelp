import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/models/user.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;

  EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserModel user;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();
  bool isEditingPhotoUrl =
      false; // Переменная для отслеживания состояния формы для ввода URL-адреса фото

  void dispose() {
    nameController.dispose();
    idController.dispose();
    paymentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;
    nameController.text = user.displayName ?? '';
    idController.text = user.id ?? '';
    photoUrlController.text = user.photoUrl ?? '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              foto(),
              registration(),
              save(),
            ],
          ),
        ),
      ),
    );
  }

  Widget foto() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEditingPhotoUrl =
              true; // При нажатии на фото устанавливаем состояние, что нужно открыть форму для ввода URL-адреса фото
        });
      },
      child: isEditingPhotoUrl
          ? TextFormField(
              // Форма для ввода URL-адреса фото
              controller: photoUrlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите URL-адрес фото',
              ),
            )
          : Container(
              width: 200,
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                textDirection: TextDirection.ltr,
                children: [
                  Image.network(
                    photoUrlController.text,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    color: Colors.white,
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget registration() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Ваше Имя и Фамилия',
              style: TextStyle(
                fontSize: 20,
              ),
            )),
        SizedBox(
          width: 350,
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Имя Фамилия',
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2),
            alignment: Alignment.centerLeft,
            child: Text(
              'ID пользователя',
              style: TextStyle(
                fontSize: 20,
              ),
            )),
        SizedBox(
          width: 350,
          child: TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Придумайте ID',
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2),
            alignment: Alignment.centerLeft,
            child: Text(
              'Способы оплаты',
              style: TextStyle(
                fontSize: 20,
              ),
            )),
        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '**** **** **** 0987',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 2, top: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(Icons.add, size: 25, color: Colors.grey),
              Text(
                'Добавить способ оплаты',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget save() {
    return ElevatedButton(
      onPressed: () async {
        String name = nameController.text;
        String id = idController.text;
        String photoUrl = photoUrlController.text;

        await user.updateUser(id, name,newPhotoUrl: photoUrl);
        await user.updateUserOnFirestore();
        BlocProvider.of<ApiBloc>(context).add(ProfileEvent(user.uid));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple[100]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        'Сохранить',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
