import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechat/providers/AuthenticationProvider.dart';
import 'package:mechat/providers/BaseProviders.dart';

class AuthenticationRepository {
  BaseAuthenticationProvider authenticationProvider = AuthenticationProvider();

  Future<User> signInWithGoogle() => authenticationProvider.signInWithGoogle();
  Future<void> signOutUser() => authenticationProvider.signOutUser();

  Future<User> getCurrentUser() => authenticationProvider.getCurrentUser();

  Future<bool> isLoggedIn() => authenticationProvider.isLoggedIn();
}
