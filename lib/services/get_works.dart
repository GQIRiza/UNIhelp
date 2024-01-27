import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unihelp/models/work.dart';

Future<List<Work>> getWorksByFilters({
  String? selectedUni,
  String? selectedDiscipline,
  String? selectedType,
}) async {
  Query collectionReference = FirebaseFirestore.instance.collection('works');

  if (selectedUni != null) {
    collectionReference = collectionReference.where('selectedUni', isEqualTo: selectedUni);
  }

  if (selectedDiscipline != null) {
    collectionReference = collectionReference.where('selectedDiscipline', isEqualTo: selectedDiscipline);
  }

  if (selectedType != null) {
    collectionReference = collectionReference.where('selectedType', isEqualTo: selectedType);
  }

  QuerySnapshot querySnapshot = await collectionReference.get();

  List<Work> works = querySnapshot.docs.map((doc) {
    return Work(
      id: doc.id,
      workName: doc['workName'],
      workDescription: doc['workDescription'],
      fileLink: doc['fileLink'],
      selectedUni: doc['selectedUni'],
      selectedDiscipline: doc['selectedDiscipline'],
      selectedType: doc['selectedType'],
      selectedDateTime: doc['selectedDateTime'],
      userUid: doc['userUid'],
    );
  }).toList();

  return works;
}
