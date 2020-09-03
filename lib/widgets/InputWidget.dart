import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  InputWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                icon: Icon(Icons.face),
                onPressed: () {},
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: TextField(
                  style: TextStyle(
                      color: Palette.primaryTextColor, fontSize: 15.0),
                  controller: textEditingController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Palette.greyColor))),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
                color: Palette.primaryColor,
              ),
            ),
            color: Colors.white,
          )
        ],
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Palette.greyColor, width: 0.5)),
          color: Colors.white),
    );
  }
}
