import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/bloc/authentication_state.dart';
import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:unihelp/models/user.dart';
import 'package:unihelp/services/get_profile.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(StartState()) {
    on<SearchEvent>(_getSearchPage);
    on<DialogEvent>(_getDialogPage);
    on<ProfileEvent>(_getProfilePage);
    on<EditProfileEvent>(_getEditProfilePage);
    on<UnisEvent>(_getUnisPage);
    on<DisciplinesEvent>(_getDisciplinesPage);
    on<TypesEvent>(_getTypesPage);
    on<StartEvent>(_getStartPage);
  }

  _getSearchPage(SearchEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(SearchState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getDialogPage(DialogEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(DialogState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getProfilePage(ProfileEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      UserModel user = await getProfile(event.uid);

      emitter(ProfileState(user));
    } catch (error) {
      print(error);
      emitter(ErrorState());
    }
  }

  _getEditProfilePage(
      EditProfileEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      UserModel user = await getProfile(event.uid);

      emitter(EditProfileState(
          user)); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getUnisPage(UnisEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('unis')
          .get(); // Fetch data from Firestore
      List<Uni> unis = await querySnapshot.docs.map((doc) {
        return Uni(
          id: doc.id,
          title: doc['title'],
          labelUrl: doc['labelUrl'],
        );
      }).toList();
      emitter(UnisState(unis));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getDisciplinesPage(
      DisciplinesEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('disciplines')
          .get(); // Fetch data from Firestore
      List<Discipline> disciplines = await querySnapshot.docs.map((doc) {
        return Discipline(
          id: doc.id,
          title: doc['title'],
        );
      }).toList();
      emitter(DisciplinesState(disciplines));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getTypesPage(TypesEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('types')
          .get(); // Fetch data from Firestore
      List<TypeOfWork> typeOfWork = await querySnapshot.docs.map((doc) {
        return TypeOfWork(
          id: doc.id,
          title: doc['title'],
        );
      }).toList();
      emitter(TypesState(typeOfWork));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getStartPage(StartEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(StartState());
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }
}
