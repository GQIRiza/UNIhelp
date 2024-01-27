import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/AuthenticationBloc.dart';
import 'package:unihelp/firebase_options.dart';
import 'package:unihelp/screens/authentication_page.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc(),
          ),
          BlocProvider<ApiBloc>(
            create: (_) => ApiBloc(),
          )
        ],
        child: const MyHomePage(), // Set MyHomePage as the home screen
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiBloc>(context)
        .add(SearchEvent()); // Dispatch an event to fetch the list of notes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            BlocProvider.of<ApiBloc>(context).add(SearchEvent());
          } else if (index == 1) {
            User user = FirebaseAuth.instance.currentUser!;
            BlocProvider.of<ApiBloc>(context).add(ProfileEvent(user.uid));
          } else if (index == 2) {
            BlocProvider.of<ApiBloc>(context).add(DialogEvent());
          }
        },
        currentIndex: _selectedIndex,
      ),
      body:
          const AuthenticationFlowScreen(), // Build the UI based on the current state
    );
  }
}
