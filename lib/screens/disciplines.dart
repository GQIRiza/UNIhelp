import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/models/discipline.dart';

class DisciplinesPage extends StatefulWidget {
  final List<Discipline> disciplines; // Параметр для списка университетов

  const DisciplinesPage({Key? key, required this.disciplines})
      : super(key: key);

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
          child: ListView.builder(
            itemCount: widget.disciplines.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.center,
                  width: 370,
                  height: 80,
                  margin: const EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(widget.disciplines[index].title),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(ListWorksByFilterEvent(selectedDiscipline: widget.disciplines[index].id));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
