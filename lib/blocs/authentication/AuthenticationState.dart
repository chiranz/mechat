import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechat/models/CurrentUser.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  final List props = const <dynamic>[];
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthInProgress extends AuthenticationState {
  @override
  String toString() => "AuthInProgress";
}

class Authenticated extends AuthenticationState {
  final User user;
  Authenticated(this.user);

  @override
  String toString() => "Authenticated";
}

class PreFillData extends AuthenticationState {
  final CurrentUser user;
  PreFillData(this.user);

  @override
  String toString() => "PreFillData";
}

class UnAuthenticated extends AuthenticationState {
  @override
  String toString() => "UnAuthenticated";
}

class RecivedProfilePicture extends AuthenticationState {
  final File file;

  RecivedProfilePicture(this.file);

  @override
  String toString() => "RecivedProfilePicture";
}

class ProfileUpdateProgress extends AuthenticationState {
  @override
  String toString() => "ProfileUpdateProgress";
}

class ProfileUpdated extends AuthenticationState {
  @override
  String toString() => "ProfileComplete";
}
