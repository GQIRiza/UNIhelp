import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/api_bloc.dart';
import 'package:unihelp/bloc/api_states.dart';
import 'package:unihelp/screens/dialogues.dart';
import 'package:unihelp/screens/disciplines.dart';
import 'package:unihelp/screens/login.dart';
import 'package:unihelp/screens/profile.dart';
import 'package:unihelp/screens/redactor.dart';
import 'package:unihelp/screens/search.dart';
import 'package:unihelp/screens/start.dart';
import 'package:unihelp/screens/types_work.dart';
import 'package:unihelp/screens/unis.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});

  static String id = 'main screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return buildBloc(snapshot.data);
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }

  Widget buildBloc(user) {
    return BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
      print(state);
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        ); // Show a loading indicator while fetching data// Show the note details screen
      } else if (state is ErrorState) {
        return const Center(
          child: Text("Error"),
        ); // Show an error message if there's an error state
      } else if (state is SearchState) {
        return const SearchPage();
      } else if (state is DialogState) {
        return DialoguePage();
      } else if (state is ProfileState) {
        return ProfilePage(user: state.user,);
      } else if (state is EditProfileState) {
        return EditProfilePage(user: state.user,);
      } else if (state is UnisState) {
        return UnisPage(unis: state.unis);
      } else if (state is DisciplinesState) {
        return DisciplinesPage(disciplines: state.disciplines);
      } else if (state is TypesState) {
        return TypesPage(types: state.types);
      } else if (state is StartState) {
        return const StartPage();
      } else {
        return const Text(
          "Nothing",
        ); // Show a default message if the state is not recognized
      }
    });
  }
}
