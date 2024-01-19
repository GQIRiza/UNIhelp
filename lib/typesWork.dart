import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';

class TypesPage extends StatefulWidget {
  const TypesPage({super.key});

  @override
  _TypesPageState createState() => _TypesPageState();
}

class _TypesPageState extends State<TypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          'Виды работ',
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
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Курсовые работы',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Сочинения',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Дипломные работы',
                  style: TextStyle(
                      fontSize: 26, fontFamily: "Inter", color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Проекты',
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
