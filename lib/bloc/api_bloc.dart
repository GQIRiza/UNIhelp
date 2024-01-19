import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(StartState()) {
    on<SearchEvent>(_getSearchPage);
    on<DialogEvent>(_getDialogPage);
    on<ProfileEvent>(_getProfilePage);
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
      emitter(ProfileState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getUnisPage(UnisEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(UnisState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getDisciplinesPage(DisciplinesEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(DisciplinesState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getTypesPage(TypesEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(TypesState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getStartPage(StartEvent event, Emitter<ApiStates> emitter) async {
    emitter(LoadingState()); // Emit loading state
    try {
      emitter(StartState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }
}
