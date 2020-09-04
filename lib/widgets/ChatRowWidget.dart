import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mechat/config/Assets.dart';
import 'package:mechat/config/Styles.dart';

class ChatRowWidget extends StatelessWidget {
  const ChatRowWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          flex: 8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: Image.asset(Assets.user).image,
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Someone",
                      style: Styles.textHeading,
                    ),
                    Text(
                      "How are you?",
                      style: Styles.subText,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(DateFormat('kk:mm')
                  .format(DateTime.fromMicrosecondsSinceEpoch(1599209221447)))
            ],
          ),
        )
      ]),
    );
  }
}
