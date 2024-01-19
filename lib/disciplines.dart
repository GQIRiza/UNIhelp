import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';

class DisciplinesPage extends StatefulWidget {
  const DisciplinesPage({super.key});

  @override
  _DisciplinesPageState createState() => _DisciplinesPageState();
}

class _DisciplinesPageState extends State<DisciplinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          'Предметы',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),
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
                //name(),
                types(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, bottom: 10),
      alignment: Alignment.centerLeft,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
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
    onTap:
    () {};
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
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: 370,
            height: 80,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
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
