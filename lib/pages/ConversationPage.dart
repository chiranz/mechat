import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';
import 'package:mechat/widgets/ChatAppBar.dart';
import 'package:mechat/widgets/ChatListWidget.dart';
import 'package:mechat/widgets/ConversationBottomSheet.dart';
import 'package:mechat/widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: ChatAppBar(),
        body: Container(
          color: Palette.chatBackgroundColor,
          child: Stack(
            children: [
              Column(
                children: [
                  ChatListWidget(),
                  GestureDetector(
                    child: InputWidget(),
                    onPanUpdate: (details) {
                      if (details.delta.dy < 0) {
                        _scaffoldKey.currentState.showBottomSheet(
                            (context) => ConversationBottomSheet());
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
