import 'package:flutter/material.dart';

class QuizFlatButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final Color colour;
  QuizFlatButton(this.title, this.onPress, this.colour);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
                color: colour, onPressed: onPress, child: Text(title))));
  }
}
