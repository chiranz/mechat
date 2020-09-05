import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';
import 'package:mechat/config/Styles.dart';
import 'package:mechat/widgets/ChatRowWidget.dart';
import 'package:mechat/widgets/NavigationPillWidget.dart';

class ConversationBottomSheet extends StatefulWidget {
  ConversationBottomSheet({Key key}) : super(key: key);

  @override
  _ConversationBottomSheetState createState() =>
      _ConversationBottomSheetState();
}

class _ConversationBottomSheetState extends State<ConversationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            GestureDetector(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  NavigationPillWidget(),
                  Center(
                    child: Text(
                      "Messages",
                      style: Styles.textHeading,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              onVerticalDragEnd: (details) {
                print("Dragged down");
                if (details.primaryVelocity > 50) {
                  Navigator.pop(context);
                }
              },
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatRowWidget();
                },
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 75, right: 20),
                      child: Divider(
                        color: Palette.accentColor,
                      ),
                    ),
                itemCount: 5)
          ],
        ),
      ),
    );
  }
}
