import 'package:flutter/material.dart';

class DisciplinesPage extends StatefulWidget {
  @override
  _DisciplinesPageState createState() => _DisciplinesPageState();
}

class _DisciplinesPageState extends State<DisciplinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Name(),
            Types(),
          ],
        ),
      ),
    );
  }


  Widget Name() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Icon( Icons.arrow_back_ios_new_rounded,),
          Text(
            'Предметы',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
    onTap:(){};
  }

  Widget Types() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Философия',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Математика',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Политология',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Метрология',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Биология',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Русский язык',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Английский язык',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Физика',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
