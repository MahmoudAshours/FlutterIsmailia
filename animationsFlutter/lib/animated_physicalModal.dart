import 'package:flutter/material.dart';

class AnimatedPhysicalModelSession extends StatefulWidget {
  @override
  _AnimatedPhysicalModelSessionState createState() =>
      _AnimatedPhysicalModelSessionState();
}

class _AnimatedPhysicalModelSessionState
    extends State<AnimatedPhysicalModelSession> {
  Color _shadowColor = Colors.white;
  double _elevation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _shadowColor = Colors.black;
            _elevation = 10;
          });
        },
      ),
      body: Center(
        child: AnimatedPhysicalModel(
            child: FlutterLogo(
              size: 100,
              colors: Colors.orange,
            ),
            shape: BoxShape.circle,
            elevation: _elevation,
            color: _shadowColor,
            shadowColor: _shadowColor,
            duration: Duration(seconds: 2)),
      ),
    );
  }
}
