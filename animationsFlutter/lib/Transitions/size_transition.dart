import 'package:flutter/material.dart';

class SizeTransitionSession extends StatefulWidget {
  @override
  _SizeTransitionState createState() => _SizeTransitionState();
}

class _SizeTransitionState extends State<SizeTransitionSession>
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
    _animation = Tween(begin: 0.0, end: 20.0)
        .animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: SizeTransition(
        sizeFactor: _animation,
        child: FlutterLogo(size: 200,),
      ),
    );
  }
}
