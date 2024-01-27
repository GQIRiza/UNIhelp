import 'package:unihelp/bloc/api_events.dart';
import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:unihelp/models/user.dart';
import 'package:unihelp/models/work.dart';

abstract class ApiStates {}

class InitState extends ApiStates {}

class LoadingState extends ApiStates {}

class ErrorState extends ApiStates {}

class SearchState extends ApiStates {}

class DialogState extends ApiStates {}

class ProfileState extends ApiStates {
  final UserModel user;

  ProfileState(this.user);
}

class EditProfileState extends ApiStates {
  final UserModel user;

  EditProfileState(this.user);
}

class UnisState extends ApiStates {
  final List<Uni> unis;

  UnisState(this.unis);
}

class TypesState extends ApiStates {
  final List<TypeOfWork> types;

  TypesState(this.types);
}

class StartState extends ApiStates {}

class DisciplinesState extends ApiStates {
  final List<Discipline> disciplines;

  DisciplinesState(this.disciplines);
}

class AddWorkState extends ApiStates {
  final List<Uni> unis;
  final List<Discipline> disciplines;
  final List<TypeOfWork> types;

  AddWorkState(this.unis, this.disciplines, this.types);
}

class ListWorksByFilterState extends ApiStates {
  final String? selectedUni;
  final String? selectedDiscipline;
  final String? selectedType;

  ListWorksByFilterState({this.selectedUni, this.selectedDiscipline, this.selectedType});
}
