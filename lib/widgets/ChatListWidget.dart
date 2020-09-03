import 'package:flutter/material.dart';
import 'package:mechat/widgets/ChatItemWidget.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  ChatListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement Build
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) => ChatItemWidget(
          index: index,
        ),
        itemCount: 20,
        reverse: true,
        controller: listScrollController,
      ),
    );
  }
}
