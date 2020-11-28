import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mechat/blocs/authentication/AuthenticationBloc.dart';

import 'package:mechat/main.dart';
import 'package:mechat/pages/RegisterPage.dart';
import 'package:mechat/repositories/AuthenticationRepository.dart';
import 'package:mechat/repositories/StorageRepository.dart';
import 'package:mechat/repositories/UserDataRepository.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepository();
    final UserDataRepository userDataRepository = UserDataRepository();
    final StorageRepository storageRepository = StorageRepository();
    await tester.pumpWidget(BlocProvider(
      create: (context) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userDataRepository: userDataRepository,
          storageRepository: storageRepository),
      child: MeChat(),
    ));
    expect(find.byType(RegisterPage), findsOneWidget);
  });
}
