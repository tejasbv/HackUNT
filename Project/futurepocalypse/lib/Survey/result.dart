import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int score;

  String s =
      "We have recorded your Answers, You will recieve a personalized email shortly that will help you navigate through this apocalyptic situation easily \n \n Thank you";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            s,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
