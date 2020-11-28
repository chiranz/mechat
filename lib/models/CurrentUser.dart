import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUser {
  final String uid;
  final String documentId;
  final String name;
  final String username;
  final int age;
  final String photoUrl;
  final String email;

  CurrentUser({
    this.email,
    this.uid,
    this.documentId,
    this.name,
    this.username,
    this.age,
    this.photoUrl,
  });

  factory CurrentUser.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return CurrentUser(
        uid: data['uid'],
        documentId: data['documentId'],
        name: data['name'],
        username: data['username'],
        age: data['age'],
        email: data['email'],
        photoUrl: data['photoUrl']);
  }
  factory CurrentUser.fromMap(Map data) {
    return CurrentUser(
        uid: data['uid'],
        documentId: data['documentId'],
        name: data['name'],
        username: data['username'],
        age: data['age'],
        email: data['email'],
        photoUrl: data['photoUrl']);
  }

  @override
  String toString() {
    return '{ uid: $uid, documentId: $documentId, name: $name, username: $username, photoUrl: $photoUrl, email: $email}';
  }
}
