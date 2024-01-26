import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZadaniePage extends StatefulWidget {

  const ZadaniePage({Key? key}) : super(key: key);

  @override
  _ZadaniePageState createState() => _ZadaniePageState();
}

class _ZadaniePageState extends State<ZadaniePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(
            children: [
              sozdanie(),
              add(),
              save(),

            ],
          ),
        ),
      ),
    );
  }

  Widget sozdanie(){
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.arrow_back,),
        Text('   '),
        Text('Создание задания',
          style: TextStyle(
            fontSize: 26,
          ),),
      ],
    );
  }
  Widget add() {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20, bottom: 2, top: 20),
              alignment: Alignment.centerLeft,
              child: Text('Университет', style: TextStyle(fontSize: 16,color: Colors.deepPurple),)),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите или выберите из списка',
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
              margin: EdgeInsets.only(left: 20,bottom: 2,),
              alignment: Alignment.centerLeft,
              child: Text('Предмет', style: TextStyle(fontSize: 16, color: Colors.deepPurple),)),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите или выберите из списка',
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 6), width: 350, height: 40,
            decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Приложить файл',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.file_copy),
              ],
            ), ),
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 26, top: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.add_circle_outlined, size: 30,color: Colors.deepPurple ),
                Text('  '),
                Text('Ограничение по времени',
                  style: TextStyle(fontSize: 16,),),
              ],
            ),)
        ]
    );
  }

  Widget save(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 6),
      width: 200,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Сохранить',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}




