import 'package:flutter/material.dart';

class UnisPage extends StatefulWidget {
  @override
  _UnisPageState createState() => _UnisPageState();
}

class _UnisPageState extends State<UnisPage> {
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
            'Университеты',
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
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://evmhistory.ru/images/university/spbu_1.png',
                  height: 50,
                  width: 50,
                ),
                Text('       '),
                Text(
                  'СПБГУ',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                )
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
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Emblem-spbpu.png',
                  height: 50,
                  width: 50,
                ),
                Text('       '),
                Text(
                  'СПБПУ',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                )
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
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://translated.turbopages.org/proxy_u/en-ru.ru.769be002-65a98ceb-532ab520-74722d776562/https/upload.wikimedia.org/wikipedia/commons/4/43/ITMO_University_official_logo_horizontal.png',
                  height: 60,
                  width: 60,
                ),
                Text('       '),
                Text(
                  'ИТМО',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
