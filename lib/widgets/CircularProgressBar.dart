import 'package:flutter/material.dart';
import 'package:mechat/config/Palette.dart';

class CircularProgressBar extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  const CircularProgressBar({Key key, this.begin, this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: [Palette.gradientStartColor, Palette.gradientEndColor])),
      child: Column(
        children: [
          Container(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
