import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String uid;
  late String? id;
  late String email;
  late String? displayName;
  String? photoUrl; // Необязательное поле для фото профиля

  UserModel({this.id, required this.email, this.displayName, required this.uid, this.photoUrl});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL, // Используем photoURL из объекта User в качестве значения по умолчанию для photoUrl
    );
  }

  Future<void> updateUser(String newId, String newDisplayName, {String? newPhotoUrl}) async {
    displayName = newDisplayName;
    id = newId;
    photoUrl = newPhotoUrl; // Обновляем photoUrl при необходимости
  }

  Future<void> updateUserOnFirestore() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Map<String, dynamic> userData = {
      'uid': uid,
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl, // Добавляем photoUrl в данные для обновления на Firestore
    };
    await users.doc(uid).update(userData);
  }
}