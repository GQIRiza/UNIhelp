import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unihelp/models/discipline.dart';

Future<List<Discipline>> getDisciplines() async {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('disciplines')
      .get(); // Fetch data from Firestore
  List<Discipline> disciplines = await querySnapshot.docs.map((doc) {
    return Discipline(
      id: doc.id,
      title: doc['title'],
    );
  }).toList();
  return disciplines;
}

