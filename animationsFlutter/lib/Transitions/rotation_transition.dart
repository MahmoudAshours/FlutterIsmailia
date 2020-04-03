import 'package:flutter/material.dart';
class RotationTransitionSession extends StatefulWidget {
  @override
  _RotationTransitionState createState() => _RotationTransitionState();
}

class _RotationTransitionState extends State<RotationTransitionSession> with SingleTickerProviderStateMixin{
   //Animation class
  Animation _animation;
  //Animation controller (Tween)
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
    _animation = Tween(begin: 0.0, end: 20.0)
        .animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}