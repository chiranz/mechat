import 'package:flutter/material.dart';
import 'package:mechat/config/Assets.dart';
import 'package:mechat/config/Palette.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;
  const ChatAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(color: Palette.primaryTextColor, fontSize: 20);
    var textStyle = TextStyle(
      color: Palette.secondaryColor,
    );
    double width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5.0),
        ]),
        child: Container(
          color: Palette.primaryBackgroundColor,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.attach_file),
                                  color: Palette.secondaryColor,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Chiranjibi Poudyal",
                                      style: textHeading,
                                    ),
                                    Text("@chiranjibi")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                        child: Row(
                          children: [
                            Text(
                              "Photos",
                              style: textStyle,
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Palette.primaryTextColor,
                            ),
                            Text(
                              "Videos",
                              style: textStyle,
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Palette.primaryTextColor,
                            ),
                            Text(
                              "Files",
                              style: textStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // This is a display picture.
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: (80 - width * 0.06) / 2,
                      backgroundImage: Image.asset(Assets.user).image,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(height);
}
