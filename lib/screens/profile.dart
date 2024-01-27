import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/AuthenticationBloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/bloc/authentication_Event.dart';
import 'package:unihelp/models/user.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              profipic(),
              UserName(widget.user),
              email(widget.user),
              Userid(widget.user),
              Student(),
              Settings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profipic() {
    return Container(
      width: 200,
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50), // Пример скругления изображения
        child: widget.user.photoUrl != ""
            ? Image.network(
          widget.user.photoUrl!,
          fit: BoxFit.fill,
        )
            : Image.network(
          'https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C-icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?s=2048x2048&w=is&k=20&c=uks2o5oyCNEKIzrVXaju9rdBA76BO5FAt9_JSETCzqg=', // Путь к изображению-заглушке
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget UserName(UserModel user) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        user.title ?? 'No displayName',
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget email(UserModel user) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        user.email ?? 'No email',
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget Userid(UserModel user) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        user.id ?? 'No id',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget Student() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 6),
      width: 200,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Студент',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget Settings() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            User user = FirebaseAuth.instance.currentUser!;
            BlocProvider.of<ApiBloc>(context).add(EditProfileEvent(user.uid));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Text(
              'Редактировать профиль',
              style: TextStyle(
                  fontSize: 20, fontFamily: "Inter", color: Colors.black),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Способы оплаты',
                style: TextStyle(
                    fontSize: 20, fontFamily: "Inter", color: Colors.black),
              ),
              Text(
                '*0987',
                style: TextStyle(
                    fontSize: 18, fontFamily: "Inter", color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Text(
            'Настройка уведомлений',
            style: TextStyle(
                fontSize: 20, fontFamily: "Inter", color: Colors.black),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Text(
            'Поддержка',
            style: TextStyle(
                fontSize: 20, fontFamily: "Inter", color: Colors.black),
          ),
        ),
        InkWell(
          onTap: () =>
              BlocProvider.of<ApiBloc>(context).add(AddWorkEvent()),
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Text(
              'Добавить задание',
              style: TextStyle(
                  fontSize: 20, fontFamily: "Inter", color: Colors.black),
            ),
          ),
        ),
        InkWell(
          onTap: () =>
              BlocProvider.of<AuthenticationBloc>(context).add(SignOut()),
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Text(
              'Выйти',
              style: TextStyle(
                  fontSize: 20, fontFamily: "Inter", color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
