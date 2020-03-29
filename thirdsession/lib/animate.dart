import 'package:flutter/material.dart';

class Animate extends StatefulWidget {
  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  double _top = 20.0;
  double _right = 30.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Text("Move"),
          onPressed: () {
            setState(() {
              _top += 20;
              _right += 20;
              print(_top);
            });
          }),
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: _top,
            right: _right,
            child: Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
