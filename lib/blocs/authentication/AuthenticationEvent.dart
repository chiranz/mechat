import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  final List props = const <dynamic>[];
}

class AppLaunched extends AuthenticationEvent {
  @override
  String toString() => 'AppLaunched';
}

class ClickedGoogleLogin extends AuthenticationEvent {
  String toString() => "ClickedGoogleLogin";
}

class LoggedIn extends AuthenticationEvent {
  final User user;
  LoggedIn(this.user);

  @override
  String toString() => 'LoggedIn';
}

class PickedProfilePicture extends AuthenticationEvent {
  final File profileImage;

  PickedProfilePicture(this.profileImage);

  @override
  String toString() => 'PickedProfilePicture';
}

class SaveProfile extends AuthenticationEvent {
  final File profileImage;
  final int age;
  final String username;

  SaveProfile(this.profileImage, this.age, this.username);

  @override
  String toString() => 'SaveProfile';
}

class ClickedLogout extends AuthenticationEvent {
  @override
  String toString() => "ClickedLogout";
}
