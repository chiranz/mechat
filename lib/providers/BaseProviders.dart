import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechat/models/CurrentUser.dart';

abstract class BaseAuthenticationProvider {
  Future<User> signInWithGoogle();
  Future<void> signOutUser();
  Future<User> getCurrentUser();
  Future<bool> isLoggedIn();
}

abstract class BaseUserDataProvider {
  Future<CurrentUser> saveDetailsFromGoogleAuth(User user);
  Future<CurrentUser> saveProfileDetails(
    String uid,
    String profileImageUrl,
    int age,
    String username,
  );
  Future<bool> isProfileComplete(String uid);
}

abstract class BaseStorageProvider {
  Future<String> uploadImage(File file, String path);
}
