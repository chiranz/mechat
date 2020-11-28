import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechat/blocs/authentication/AuthenticationBloc.dart';
import 'package:mechat/blocs/authentication/Bloc.dart';
import 'package:mechat/pages/RegisterPage.dart';
import 'package:mechat/repositories/AuthenticationRepository.dart';
import 'package:mechat/repositories/StorageRepository.dart';
import 'package:mechat/repositories/UserDataRepository.dart';
import 'package:mechat/widgets/ConversationPageSlide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final UserDataRepository userDataRepository = UserDataRepository();
  final StorageRepository storageRepository = StorageRepository();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userDataRepository: userDataRepository,
        storageRepository: storageRepository),
    child: MeChat(),
  ));
}

class MeChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is UnAuthenticated) {
          return RegisterPage();
        } else if (state is ProfileUpdated) {
          return ConversationPageSlide();
        } else {
          return RegisterPage();
        }
      }),
    );
  }
}
