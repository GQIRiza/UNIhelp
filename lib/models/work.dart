import 'package:cloud_firestore/cloud_firestore.dart';

class Work {
  final String id;
  final String workName;
  final String workDescription;
  final String fileLink;
  final String selectedUni;
  final String selectedDiscipline;
  final String selectedType;
  final Timestamp selectedDateTime;
  final String userUid;

  Work({
    required this.id,
    required this.workName,
    required this.workDescription,
    required this.fileLink,
    required this.selectedUni,
    required this.selectedDiscipline,
    required this.selectedType,
    required this.selectedDateTime,
    required this.userUid,
  });
}
