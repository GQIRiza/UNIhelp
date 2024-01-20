import 'package:flutter/material.dart';


class RedactorPage extends StatefulWidget {
  RedactorPage({Key? key}) : super(key: key);

  @override
  State<RedactorPage> createState() => _RedactorPageState();
}

class _RedactorPageState extends State<RedactorPage> {
  @override
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

  Widget foto(){
    return Container( width: 200,
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      child: Stack( alignment: AlignmentDirectional.bottomEnd,
          textDirection: TextDirection.ltr,
          children: [
            Image.network(
              'https://cs12.pikabu.ru/post_img/big/2022/03/21/10/164788475811377451.jpg',
              fit: BoxFit.fill,
            ),
            Container( color: Colors.white,
                child: Icon(Icons.add_a_photo_rounded, size: 40, color: Colors.black,)),
          ]
      ),
    );
  }
  Widget registration() {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2, top: 20),
            alignment: Alignment.centerLeft,
            child: Text('Ваше Имя и Фамилия', style: TextStyle(fontSize: 20,),)),
        SizedBox(
          width: 350,
          child: TextFormField(
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
            child: Text('ID пользователя', style: TextStyle(fontSize: 20,),)),
        SizedBox(
          width: 350,
          child: TextFormField(
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
            child: Text('Номер телефона', style: TextStyle(fontSize: 20,),)),
        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '+7',
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2),
            alignment: Alignment.centerLeft,
            child: Text('Email', style: TextStyle(fontSize: 20,),)),
        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Введите Email',
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, bottom: 2),
            alignment: Alignment.centerLeft,
            child: Text('Способы оплаты', style: TextStyle(fontSize: 20,),)),
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
              Icon(Icons.add, size: 25,color: Colors.grey ),
              Text('Добавить способ оплаты',
                style: TextStyle(fontSize: 16, color: Colors.grey),),
            ],
          ),
        )
      ],
    );
  }
  Widget save(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 6),
      width: 200,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Сохранить',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}