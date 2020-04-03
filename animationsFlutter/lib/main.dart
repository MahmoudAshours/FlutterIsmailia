import 'package:animationsFlutter/Transitions/rotation_transition.dart';
import 'package:animationsFlutter/Transitions/size_transition.dart';
import 'package:animationsFlutter/Transitions/slide_transtionSession.dart';
import 'package:animationsFlutter/animatedCont_session.dart';
import 'package:animationsFlutter/animatedCrossFade_session.dart';
import 'package:animationsFlutter/animated_opacitysession.dart';
import 'package:animationsFlutter/animated_physicalModal.dart';
import 'package:animationsFlutter/animated_text.dart';
import 'package:animationsFlutter/modal_barrier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animation Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RotationTransitionSession());
  }
}
