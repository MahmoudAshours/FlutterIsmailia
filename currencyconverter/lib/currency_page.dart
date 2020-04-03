import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Upper part
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              child: Container(
                width:200,
                height: 200,
                child: Center(child: TextField()),
              ),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.orange, Colors.deepOrange],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),

          //lower part
          Positioned(
            top: 430,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 415,
            right: 50,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
