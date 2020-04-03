import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool covertText = true;
  TextStyle style =TextStyle(fontSize: 20, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            covertText ? covertText = false : covertText = true;
            style=TextStyle(fontSize: 60, color: Colors.blue);
          });
        },
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          child: covertText ? Text('Hello flutter') : Text("Bye flutter"),
          style: style,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}
