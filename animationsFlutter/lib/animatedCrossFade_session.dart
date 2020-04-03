import 'package:flutter/material.dart';

class AnimatedCrossFadeSession extends StatefulWidget {
  @override
  _AnimatedCrossFadeSessionState createState() =>
      _AnimatedCrossFadeSessionState();
}

class _AnimatedCrossFadeSessionState extends State<AnimatedCrossFadeSession> {
  CrossFadeState _state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _state = CrossFadeState.showSecond;
        });
      }),
      body: Center(
        child: AnimatedCrossFade(
          firstCurve: Curves.easeInExpo,
          secondCurve: Curves.bounceOut,
          firstChild: FlutterLogo(
            size: 200,
            colors: Colors.red,
          ),
          secondChild:Text('Hello flutter'),
          crossFadeState: _state,
          duration: Duration(seconds: 3),
        ),
      ),
    );
  }
}
