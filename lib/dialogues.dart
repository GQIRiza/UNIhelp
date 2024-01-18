import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialoguePage(),
    );
  }
}
class DialoguePage extends StatefulWidget {
  DialoguePage({Key? key}) : super(key: key);

  @override
  State<DialoguePage> createState() => _DialoguePageState();
}

class _DialoguePageState extends State<DialoguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text(
          'UNIhelp', style: TextStyle(fontSize: 30, fontFamily: 'Ubuntu'),)),
        backgroundColor: Color(0xff9fa8da),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Dialogues',
          ),
        ],
      ),
      body: Column(
        children: [
          Search(),
          Massage(),
        ],
      ),
    );
  }

  Widget Search() {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 300, margin: EdgeInsets.only(top: 5, left: 8),
            alignment: Alignment.centerLeft,
            child: SearchBar(
              shadowColor: MaterialStateProperty.all(Colors.deepPurple[400]),
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0)),
              onTap: () {},
              onChanged: (_) {
                ();
              },
              leading: const Icon(Icons.search),
              elevation: MaterialStateProperty.all(2.0),
              hintText: 'Поиск по сообщениям',
              hintStyle: MaterialStateProperty.all(const TextStyle(
                color: Colors.grey, fontSize: 16,)),
            ),
        ),
        Container(margin: EdgeInsets.only(right: 8, top: 5),
            child: Icon(Icons.menu, size: 40,)),
      ],
    );
  }
  Widget Massage(){
  return Column(
    children: [
      Container(padding: EdgeInsets.all(10),
      alignment: Alignment.center,
        height: 70, margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),),
      child: Row(
      children: [ Container(height: 70, width: 50, color: Colors.grey,),
      Text('       '),
      Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Имя Фамилия 1', style: TextStyle(fontSize: 20, fontFamily: "Inter",color: Colors.black),),
          Text('Текст сообщения 1', style: TextStyle(fontSize: 16, fontFamily: "Inter",color: Colors.black),),
        ],
      )
      ],
      ),),
      Divider(),
      Container(padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),),
        child: Row(
          children: [ Container(height: 70, width: 50, color: Colors.grey,),
            Text('       '),
            Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Имя Фамилия 2', style: TextStyle(fontSize: 20, fontFamily: "Inter",color: Colors.black),),
                Text('Текст сообщения 2', style: TextStyle(fontSize: 16, fontFamily: "Inter",color: Colors.black),),
              ],
            )
          ],
        ),),
      Divider(),
      Container(padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),),
        child: Row(
          children: [ Container(height: 70, width: 50, color: Colors.grey,),
            Text('       '),
            Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Имя Фамилия 3', style: TextStyle(fontSize: 20, fontFamily: "Inter",color: Colors.black),),
                Text('Текст сообщения 3', style: TextStyle(fontSize: 16, fontFamily: "Inter",color: Colors.black),),
              ],
            )
          ],
        ),),
    ],
  );}
}