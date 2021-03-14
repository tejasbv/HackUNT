import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selecthandler;
  final String answerText;

  Answer(this.selecthandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    /**********************************************************/
    // full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    // height without status and toolbar
    double height3 = (height - kToolbarHeight) / 2;
    double boxw = height > width ? width : height - 50;
    /**********************************************************/
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: TextButton(
        child: Container(
            height: 50,
            width: width / 1.35,
            //margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white38),
            child: Center(
                child: Text(
              answerText,
              style: TextStyle(fontSize: 25, color: Colors.amber[200]),
            ))),
        onPressed: selecthandler,
      ),
    );
  }
}
