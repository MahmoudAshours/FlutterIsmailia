import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List numbers = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '+',
    '-',
    '.',
    '0',
    '=',
    'Clear'
  ];
  
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String shownValue = "0";

  void itemPressed(String element) {
    if (element == "Clear") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (element == "+" ||
        element == "-" ||
        element == "/" ||
        element == "x") {
      num1 = double.parse(shownValue);
      operand = element;
      _output = "0";
    } else if (element == ".") {
      if (_output.contains(".")) {
        print("You can't enter another decimal");
        return;
      } else {
        _output = _output + element;
      }
    } else if (element == "=") {
      num2 = double.parse(shownValue);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + element;
    }
    setState(() {
      shownValue = double.parse(_output).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children: [
          //View part
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$shownValue',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
          //Keyboard
          Container(
            width: MediaQuery.of(context).size.width,
            height: 450,
            child: GridView.count(
                crossAxisCount: 4,
                children: numbers
                    .map(
                      (element) => InkWell(
                        onTap: () {
                          itemPressed(element);
                        },
                        child: GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 0.2)),
                            child: Center(
                              child: Text(
                                '$element',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
