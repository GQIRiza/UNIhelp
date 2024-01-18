import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Search(),
            Categories(),
            Types(),
          ],
        ),
      ),
    );
  }

  Widget Search() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SearchBar(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0)),
        onTap: () {},
        onChanged: (_) {
          ();
        },
        leading: const Icon(Icons.search),
        elevation: MaterialStateProperty.all(2.0),
        hintText: 'Поиск',
        hintStyle: MaterialStateProperty.all(const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        )),
      ),
    );
  }

  Widget Categories() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Категории',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }

  Widget Types() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/195/195496.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Университеты',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/5606/5606108.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Предметы',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/11936/11936362.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Виды работ',
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
