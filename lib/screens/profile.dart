import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/AuthenticationBloc.dart';
import 'package:unihelp/bloc/authentication_Event.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfiPic(),
            UserName(),
            Userid(),
            Student(),
            logOut(),
            Settings(),
          ],
        ),
      ),
    );
  }

  Widget ProfiPic() {
    return Container(
      alignment: Alignment.center,
      child: Image.network(
        'https://cs12.pikabu.ru/post_img/big/2022/03/21/10/164788475811377451.jpg',
        height: 200,
        width: 200,
      ),
    );
  }

  Widget UserName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Имя Фамилия',
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget Userid() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '@userID1',
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

  Widget logOut() {
    return InkWell(
      onTap: () => BlocProvider.of<AuthenticationBloc>(context).add(SignOut()),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 6),
        width: 200,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget Settings() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 6),
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
      ],
    );
  }
}
