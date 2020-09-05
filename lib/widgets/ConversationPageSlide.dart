import 'package:flutter/material.dart';
import 'package:mechat/pages/ConversationPage.dart';
import 'package:mechat/widgets/ConversationBottomSheet.dart';
import 'package:mechat/widgets/InputWidget.dart';

class ConversationPageSlide extends StatefulWidget {
  const ConversationPageSlide({Key key}) : super(key: key);

  @override
  _ConversationPageSlideState createState() => _ConversationPageSlideState();
}

class _ConversationPageSlideState extends State<ConversationPageSlide>
    with SingleTickerProviderStateMixin {
  var controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(children: [
          Expanded(
            child: PageView(
              children: [
                ConversationPage(),
                ConversationPage(),
                ConversationPage(),
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              child: InputWidget(),
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  _scaffoldKey.currentState
                      .showBottomSheet((context) => ConversationBottomSheet());
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
