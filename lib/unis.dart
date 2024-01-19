import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';

class UnisPage extends StatefulWidget {
  const UnisPage({super.key});

  @override
  _UnisPageState createState() => _UnisPageState();
}

class _UnisPageState extends State<UnisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          'Университеты',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(SearchEvent());
          },
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                types(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget types() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 14),
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
                const Text('       '),
                const Text(
                  'СПБГУ',
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
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Emblem-spbpu.png',
                  height: 50,
                  width: 50,
                ),
                const Text('       '),
                const Text(
                  'СПБПУ',
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
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.network(
                  'https://translated.turbopages.org/proxy_u/en-ru.ru.769be002-65a98ceb-532ab520-74722d776562/https/upload.wikimedia.org/wikipedia/commons/4/43/ITMO_University_official_logo_horizontal.png',
                  height: 60,
                  width: 60,
                ),
                const Text('       '),
                const Text(
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
