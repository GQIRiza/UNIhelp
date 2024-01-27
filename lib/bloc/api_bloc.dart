import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:unihelp/models/user.dart';
import 'package:unihelp/services/get_disceplines.dart';
import 'package:unihelp/services/get_profile.dart';
import 'package:unihelp/services/get_types.dart';
import 'package:unihelp/services/get_unis.dart';
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
    on<AddWorkEvent>(_getAddWorkPage);
    on<ListWorksByFilterEvent>(_getListWorksByFilterPage);
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
      List<Uni> unis = await getUnis();
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
      List<Discipline> disciplines = await getDisciplines();
      emitter(DisciplinesState(disciplines));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getTypesPage(TypesEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      List<TypeOfWork> types = await getTypes();
      emitter(TypesState(types));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getAddWorkPage(AddWorkEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      List<Uni> unis = await getUnis();
      List<Discipline> disciplines = await getDisciplines();
      List<TypeOfWork> types = await getTypes();
      emitter(AddWorkState(unis, disciplines,types));
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getListWorksByFilterPage(ListWorksByFilterEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(ListWorksByFilterState(
          selectedUni: event.selectedUni,
          selectedDiscipline: event.selectedDiscipline,
          selectedType: event.selectedType)); // Emit state с параметрами из события
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }


}
