import 'package:flutter/material.dart';
import 'package:mechat/widgets/ChatAppBar.dart';
import 'package:mechat/widgets/ChatListWidget.dart';
import 'package:mechat/widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                ChatListWidget(),
                InputWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
