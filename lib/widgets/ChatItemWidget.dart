import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mechat/config/Palette.dart';

class ChatItemWidget extends StatelessWidget {
  final int index;
  const ChatItemWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement Build.
    if (index % 2 == 0) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "This is a sent message.",
                    style: TextStyle(color: Palette.selfMessageColor),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Palette.selfMessageBackgroundColor,
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.only(right: 10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    DateFormat('dd MMM kk:mm').format(
                        DateTime.fromMicrosecondsSinceEpoch(1599128227308)),
                    style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                )
              ],
            )
          ],
        ),
      );
    }
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "This is a recieved message.",
                  style: TextStyle(color: Palette.otherMessageColor),
                ),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: 200,
                decoration: BoxDecoration(
                    color: Palette.otherMessageBackgroundColor,
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.only(left: 10),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  DateFormat('dd MMM kk:mm').format(
                      DateTime.fromMicrosecondsSinceEpoch(1599128227308)),
                  style: TextStyle(
                      color: Palette.greyColor,
                      fontSize: 12,
                      fontStyle: FontStyle.normal),
                ),
                margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
              )
            ],
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
