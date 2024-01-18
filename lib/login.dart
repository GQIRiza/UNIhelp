import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
          Start(),
          Login(),
        ],
      ),
    );
  }

  Widget Welcome() {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 30),
      alignment: Alignment.center,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Добро пожаловать в',
            style: TextStyle(color: Colors.white, fontFamily: "Ubuntu",
                fontSize: 34),),
            Text(''),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('UNI',
                  style: TextStyle(color: Colors.deepPurple[600], fontFamily: "Bubbles",
                      fontSize: 70),),

                Text('help',
                  style: TextStyle(color: Colors.deepPurple[400], fontFamily: "Bubbles",
                      fontSize: 70),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Registration(){
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 350,
          child: TextField(decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Введите логин",
          ),),
        ),
        Divider(color:Color(0xffc5cae9),),
        SizedBox(width: 350,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Введите пароль",
            ),),
        ),
      ],
    );
  }

  Widget Start() {
    return Container( margin: EdgeInsets.all(30),
      decoration: BoxDecoration(color: Colors.indigo[300], borderRadius: BorderRadius.circular(20) ),
      width: 250, height: 50,
      child: Center(
        child: Text("Зарегестрироваться", style: TextStyle(
          fontSize: 24, color: Colors.white,
        ),
        ),
      ),);
  }

  Widget Login(){
    return Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text('Уже есть аккаунт?', style: TextStyle(fontSize: 24, color: Colors.white),),

      Text('Войти', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),)
    ],

    );
  }

}