import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unihelp/models/type.dart';

Future<List<TypeOfWork>> getTypes() async {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('types')
      .get(); // Fetch data from Firestore
  List<TypeOfWork> types = await querySnapshot.docs.map((doc) {
    return TypeOfWork(
      id: doc.id,
      title: doc['title'],
    );
  }).toList();
  return types;
}

