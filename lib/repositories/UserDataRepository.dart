import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechat/models/CurrentUser.dart';
import 'package:mechat/providers/BaseProviders.dart';
import 'package:mechat/providers/UserDataProvider.dart';

class UserDataRepository {
  BaseUserDataProvider userDataProvider = UserDataProvider();

  Future<CurrentUser> saveDetailsFromGoogleAuth(User user) =>
      userDataProvider.saveDetailsFromGoogleAuth(user);
  Future<CurrentUser> saveProfileDetails(
          String uid, String profileImageUrl, int age, String username) =>
      userDataProvider.saveProfileDetails(uid, profileImageUrl, age, username);
  Future<bool> isProfileComplete(String uid) =>
      userDataProvider.isProfileComplete(uid);
}
