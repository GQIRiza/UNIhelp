import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/AuthenticationBloc.dart';
import 'package:unihelp/bloc/authentication_Event.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc5cae9),
      appBar: AppBar(
        backgroundColor: Color(0xffc5cae9),
      ),
      body: Column(
        children: [
          Welcome(),
          Registration(),
          Start(context: context),
          Login(),
        ],
      ),
    );
  }

  Widget Welcome() {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 30),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать в',
              style: TextStyle(
                  color: Colors.white, fontFamily: "Ubuntu", fontSize: 34),
            ),
            Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UNI',
                  style: TextStyle(
                      color: Colors.deepPurple[600],
                      fontFamily: "Bubbles",
                      fontSize: 70),
                ),
                Text(
                  'help',
                  style: TextStyle(
                      color: Colors.deepPurple[400],
                      fontFamily: "Bubbles",
                      fontSize: 70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Registration() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 350,
          child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Введите ваш email',
            ),
          ),
        ),
        Divider(
          color: Color(0xffc5cae9),
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Введите ваш пароль',
            ),
          ),
        ),
      ],
    );
  }

  Widget Start({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(250, 50),
        ),
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(
            SignUpUser(
              emailController.text.trim(),
              passwordController.text.trim(),
            ),
          );
        },
        child: Text(
          "Зарегистрироваться",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget Login() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(250, 50),
        ),
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(
            LoginUser(
              emailController.text.trim(),
              passwordController.text.trim(),
            ),
          );
        },
        child: Text(
          "Войти",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
