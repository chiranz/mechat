import 'package:flutter/material.dart';
import 'package:mechat/widgets/ConversationPageSlide.dart';

void main() {
  runApp(MeChat());
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
      home: ConversationPageSlide(),
    );
  }
}
