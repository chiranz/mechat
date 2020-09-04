import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';

class NavigationPillWidget extends StatelessWidget {
  const NavigationPillWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Wrap(
          children: [
            Container(
              width: 50,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 5,
              decoration: BoxDecoration(
                  color: Palette.accentColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            )
          ],
        ),
      ),
    );
  }
}
