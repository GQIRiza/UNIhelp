import 'package:unihelp/models/discipline.dart';
import 'package:unihelp/models/type.dart';
import 'package:unihelp/models/uni.dart';
import 'package:unihelp/models/user.dart';

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
