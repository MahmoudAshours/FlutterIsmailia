import 'package:flutter/material.dart';

class SlideTransitionSession extends StatefulWidget {
  @override
  _SlideTransitionSessionState createState() => _SlideTransitionSessionState();
}

class _SlideTransitionSessionState extends State<SlideTransitionSession>
    with SingleTickerProviderStateMixin {
  //Animation class
  Animation _animation;
  //Animation controller (Tween)
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
    _animation = Tween(begin: Offset(0, 0), end: Offset(60, 100))
        .animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: SlideTransition(
        position: _animation,
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
