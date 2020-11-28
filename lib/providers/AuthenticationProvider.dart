import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mechat/providers/BaseProviders.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Future<User> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    await firebaseAuth.signInWithCredential(credential);
    return firebaseAuth.currentUser;
  }

  @override
  Future<void> signOutUser() async {
    return Future.wait([
      firebaseAuth.signOut(),
      googleSignIn.signOut(),
    ]);
  }
}
