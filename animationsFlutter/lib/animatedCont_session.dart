import 'package:flutter/material.dart';

class AnimatedContainerSession extends StatefulWidget {
  @override
  _AnimatedContainerSessionState createState() =>
      _AnimatedContainerSessionState();
}

class _AnimatedContainerSessionState extends State<AnimatedContainerSession> {
  double _width = 50;
  double _height = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          child: FloatingActionButton(onPressed: () {
            setState(() {
              _width = 200;
              _height = 200;
            });
          }),
        ),
      ),
    );
  }
}
