import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  var firstCurrency = "USD";
  var secondCurrency = "CAD";
  var addedValue = 1.0;
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
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Wrap(
                    children: [
                      Container(
                        width: 130,
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              addedValue = double.parse(value);
                            });
                          },
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      FutureBuilder(
                        future: _getData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Container(
                            child: snapshot.hasData
                                ? DropdownButton(
                                    items: snapshot.data['rates'].keys
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            child: Text('$value'),
                                            value: value,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (String value) {
                                      setState(
                                        () {
                                          firstCurrency = value;
                                        },
                                      );
                                    },
                                    value: firstCurrency,
                                  )
                                : SizedBox(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white70,
                    Color(0xffFF5250),
                    Color(0xffFF5270)
                  ],
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
              child: IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  setState(
                    () {
                      var x;
                      x = firstCurrency;
                      firstCurrency = secondCurrency;
                      secondCurrency = x;
                    },
                  );
                },
                color: Colors.pinkAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 160,
            left: 100,
            child: FutureBuilder(
              future: _fetchCurrency(firstCurrency, secondCurrency),
              builder: (context, snapshot) => snapshot.hasData
                  ? Center(
                      child: Text(
                        '${(snapshot.data['rates']['$firstCurrency'] * addedValue).toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xffff5250),
                        ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 200,
            child: FutureBuilder(
              future: _getData(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        child: DropdownButton(
                          items: snapshot.data['rates'].keys
                              .map<DropdownMenuItem<String>>(
                                (element) => DropdownMenuItem<String>(
                                  child: Text('$element'),
                                  value: element,
                                ),
                              )
                              .toList(),
                          onChanged: (String value) {
                            setState(
                              () {
                                secondCurrency = value;
                              },
                            );
                          },
                          value: secondCurrency,
                        ),
                      )
                    : CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }

  _getData() async {
    var url = "https://api.exchangeratesapi.io/latest";
    final response = await http.get(url);
    var decoded = jsonDecode(response.body);
    return decoded;
  }

  _fetchCurrency(firstCurrency, secondsCurrency) async {
    var url =
        "https://api.exchangeratesapi.io/latest?symbols=$firstCurrency,$secondsCurrency";
    final response = await http.get(url);
    var decoded = jsonDecode(response.body);
    return decoded;
  }
}
