import 'package:flutter/material.dart';
import 'package:mechat/config/Assets.dart';
import 'package:mechat/config/Palette.dart';

class GoogleSignInPage extends StatelessWidget {
  final Function updatePageState;
  const GoogleSignInPage({Key key, this.updatePageState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Image.asset(
              Assets.app_icon_fg,
              height: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "MeChat Messenger",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ButtonTheme(
              height: 40,
              child: FlatButton.icon(
                onPressed: () {
                  updatePageState(1);
                },
                color: Colors.transparent,
                icon: Image.asset(
                  Assets.google_button,
                  height: 25,
                ),
                label: Text(
                  "Sign in with google.",
                  style: TextStyle(
                      color: Palette.primaryTextColorLight,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
