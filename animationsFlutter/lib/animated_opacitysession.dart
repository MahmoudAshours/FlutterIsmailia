import 'package:flutter/material.dart';

class AnimatedOpacitySession extends StatefulWidget {
  @override
  _AnimatedOpacitySessionState createState() => _AnimatedOpacitySessionState();
}

class _AnimatedOpacitySessionState extends State<AnimatedOpacitySession> {
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opacity = 1;
          });
        },
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Text(
            'Hello',
            style: TextStyle(color: Colors.black, fontSize: 80),
          ),
        ),
      ),
    );
  }
}
