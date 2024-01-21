import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unihelp/models/user.dart';

Future<UserModel> getProfile(uid) async {
  DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

  if (userSnapshot.exists) {
    UserModel user = UserModel(
      uid: userSnapshot['uid'],
      id: userSnapshot['id'],
      email: userSnapshot['email'],
      displayName: userSnapshot['displayName'],
      photoUrl: userSnapshot['photoUrl'],
    );
    return user;
  } else {

    throw Exception('User not found');
  }
}
