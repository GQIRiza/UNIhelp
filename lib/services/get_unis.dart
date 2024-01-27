  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:unihelp/models/uni.dart';

  Future<List<Uni>> getUnis() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('unis')
        .get(); // Fetch data from Firestore
    List<Uni> unis = await querySnapshot.docs.map((doc) {
      return Uni(
        id: doc.id,
        title: doc['title'],
        labelUrl: doc['labelUrl'],
      );
    }).toList();
    return unis;
  }

