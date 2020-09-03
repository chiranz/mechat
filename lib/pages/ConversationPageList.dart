import 'package:flutter/material.dart';
import 'package:mechat/pages/ConversationPage.dart';

class ConversationPageList extends StatefulWidget {
  const ConversationPageList({Key key}) : super(key: key);

  @override
  _ConversationPageListState createState() => _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ConversationPage(),
        ConversationPage(),
        ConversationPage(),
      ],
    );
  }
}
