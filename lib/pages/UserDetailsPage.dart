import 'package:flutter/material.dart';
import 'package:mechat/config/Assets.dart';
import 'package:mechat/config/Palette.dart';
import 'package:mechat/config/Styles.dart';
import 'package:numberpicker/numberpicker.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({
    Key key,
  }) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int age = 18;
  var isKeyboardOpen = false;
  // Fields related to animation of the gradient.
  // Fields related to animating the layout and pushing widgets up when the focus is on the username field
  AnimationController usernameFieldAnimationController;
  Animation profilePicHeightAnimation, usernameAnimation, ageAnimation;
  FocusNode usernameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    usernameFieldAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    profilePicHeightAnimation =
        Tween(begin: 100.0, end: 0.0).animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    usernameAnimation =
        Tween(begin: 50.0, end: 10.0).animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    ageAnimation =
        Tween(begin: 80.0, end: 10.0).animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        usernameFieldAnimationController.forward();
      } else {
        usernameFieldAnimationController.reverse();
      }
    });

    super.initState();
  }

  handleAgeChange(num value) {
    setState(() {
      age = value;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameFieldAnimationController.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  onKeyboardChanged(bool isVisible) {
    if (!isVisible) {
      FocusScope.of(context).requestFocus(FocusNode());
      usernameFieldAnimationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: profilePicHeightAnimation.value,
            ),
            Container(
              child: CircleAvatar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "Set Profile Picture",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Palette.primaryTextColorLight, fontSize: 10),
                    )
                  ],
                ),
                backgroundImage: Image.asset(Assets.user).image,
                radius: 60,
              ),
            ),
            SizedBox(
              height: ageAnimation.value,
            ),
            Text(
              "How old are you?",
              style: Styles.questionLight,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NumberPicker.horizontal(
                  initialValue: age,
                  minValue: 15,
                  maxValue: 100,
                  highlightSelectedValue: true,
                  onChanged: (num value) {
                    handleAgeChange(value);
                  },
                ),
                Text(
                  "Years",
                  style: Styles.textLight,
                ),
              ],
            ),
            SizedBox(
              height: usernameAnimation.value,
            ),
            Container(
              child: Text(
                'Choose a username',
                style: Styles.questionLight,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 120,
              child: TextField(
                textAlign: TextAlign.center,
                style: Styles.subHeadingLight,
                focusNode: usernameFocusNode,
                decoration: InputDecoration(
                    hintText: '@username',
                    hintStyle: Styles.hintTextLight,
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Palette.primaryColor, width: 0.1))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
