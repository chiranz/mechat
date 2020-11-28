import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechat/config/Paths.dart';
import 'package:mechat/models/CurrentUser.dart';
import 'package:mechat/providers/BaseProviders.dart';

class UserDataProvider extends BaseUserDataProvider {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<bool> isProfileComplete(String uid) async {
    DocumentReference ref = firestore.collection(Paths.usersPath).doc(uid);
    final DocumentSnapshot currentDocument = await ref.get();
    return (currentDocument.exists &&
        currentDocument.data().containsKey('username') &&
        currentDocument.data().containsKey('age'));
  }

  @override
  Future<CurrentUser> saveDetailsFromGoogleAuth(User user) async {
    DocumentReference ref = firestore.collection(Paths.usersPath).doc(user.uid);
    final bool userExists = await ref.snapshots().isEmpty;
    final data = {
      'uid': user.uid,
      'email': user.email,
      'name': user.displayName,
    };
    if (!userExists) {
      data['photoUrl'] = user.photoURL;
    }
    ref.set(data);
    final DocumentSnapshot currentDocument = await ref.get();
    return CurrentUser.fromFirestore(currentDocument);
  }

  @override
  Future<CurrentUser> saveProfileDetails(
      String uid, String profileImageUrl, int age, String username) async {
    DocumentReference ref = firestore.collection(Paths.usersPath).doc(uid);

    final data = {
      'photoUrl': profileImageUrl,
      'age': age,
      'username': username
    };
    ref.set(
      data,
    );
    final DocumentSnapshot currentDocument = await ref.get();
    return CurrentUser.fromFirestore(currentDocument);
  }
}
