import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(SearchState()) {
    on<SearchEvent>(_getSearchPage);
    on<DialogEvent>(_getDialogPage);
    on<ProfileEvent>(_getProfilePage);
  }

  _getSearchPage(SearchEvent event, Emitter<ApiStates> emitter) async {
    emit(LoadingState()); // Emit loading state
    try {
      emitter(SearchState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }

  _getDialogPage(DialogEvent event, Emitter<ApiStates> emitter) async {
    emit(LoadingState()); // Emit loading state
    try {
      emitter(DialogState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }
  _getProfilePage(ProfileEvent event, Emitter<ApiStates> emitter) async {
    emit(LoadingState()); // Emit loading state
    try {
      emitter(ProfileState()); // Emit note list state with the fetched notes
    } catch (error) {
      print(error);
      emitter(ErrorState()); // Emit error state in case of an error
    }
  }
}
