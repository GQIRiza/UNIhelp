import 'package:flutter/material.dart';

class DialoguePage extends StatefulWidget {
  const DialoguePage({Key? key}) : super(key: key);

  @override
  State<DialoguePage> createState() => _DialoguePageState();
}

class _DialoguePageState extends State<DialoguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            search(),
            message(),
          ],
        ),
      ),
    );
  }

  Widget search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 300,
          margin: const EdgeInsets.only(top: 5, left: 8),
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
              color: Colors.grey,
              fontSize: 16,
            )),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(right: 8, top: 5),
            child: const Icon(
              Icons.menu,
              size: 40,
            )),
      ],
    );
  }

  Widget message() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 70,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 50,
                color: Colors.grey,
              ),
              const SizedBox(width: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Имя Фамилия 1',
                    style: TextStyle(
                        fontSize: 20, fontFamily: "Inter", color: Colors.black),
                  ),
                  Text(
                    'Текст сообщения 1',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Inter", color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 50,
                color: Colors.grey,
              ),
              const SizedBox(width: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Имя Фамилия 2',
                    style: TextStyle(
                        fontSize: 20, fontFamily: "Inter", color: Colors.black),
                  ),
                  Text(
                    'Текст сообщения 2',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Inter", color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 50,
                color: Colors.grey,
              ),
              const SizedBox(width: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Имя Фамилия 3',
                    style: TextStyle(
                        fontSize: 20, fontFamily: "Inter", color: Colors.black),
                  ),
                  Text(
                    'Текст сообщения 3',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Inter", color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
