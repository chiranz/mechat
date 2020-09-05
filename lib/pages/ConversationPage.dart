import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';
import 'package:mechat/widgets/ChatAppBar.dart';
import 'package:mechat/widgets/ChatListWidget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ChatAppBar(),
        ),
        Expanded(
          flex: 11,
          child: Container(
            color: Palette.chatBackgroundColor,
            child: Column(
              children: [ChatListWidget()],
            ),
          ),
        )
      ],
    );
  }
}
