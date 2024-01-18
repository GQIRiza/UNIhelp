import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(PoiskState()) {
    on<PoiskEvent>(_getPoiskPage);
    on<DialogEvent>(_getDialogPage);
    on<ProfileEvent>(_getProfilePage);
  }

  _getPoiskPage(PoiskEvent event, Emitter<ApiStates> emitter) async {
    emit(LoadingState()); // Emit loading state
    try {
      emitter(PoiskState()); // Emit note list state with the fetched notes
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
