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
    nameController.text = user.title ?? '';
    idController.text = user.id ?? '';
    photoUrlController.text = user.photoUrl ?? '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          'Редактирование профиля',
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
      ),
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
                  photoUrlController.text != ""
                      ? Image.network(
                    photoUrlController.text,
                    fit: BoxFit.fill,
                  )
                      : Image.network(
                    'https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C-icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?s=2048x2048&w=is&k=20&c=uks2o5oyCNEKIzrVXaju9rdBA76BO5FAt9_JSETCzqg=', // Путь к изображению-заглушке
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
