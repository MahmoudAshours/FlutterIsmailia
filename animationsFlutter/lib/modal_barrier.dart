import 'package:flutter/material.dart';

class AnimatedModalBarrierSession extends StatefulWidget {
  @override
  _AnimatedModalBarrierSessionState createState() =>
      _AnimatedModalBarrierSessionState();
}

class _AnimatedModalBarrierSessionState
    extends State<AnimatedModalBarrierSession>
    with SingleTickerProviderStateMixin {
  //Animation class
  Animation _animation;
  //Animation controller (Tween)
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
    _animation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AnimatedModalBarrier(
                color: _animation,
              );
            },
          );
        },
      ),
    );
  }
}
