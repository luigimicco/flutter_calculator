import 'package:flutter/material.dart';

List buttonNames = [
  "7",
  "8",
  "9",
  "÷",
  "4",
  "5",
  "6",
  "×",
  "1",
  "2",
  "3",
  "−",
  "0",
  ".",
  "C",
  "+"
];
String expression = "0";
String result = "0";

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          // Expression Area - Top - Smallest Size
          flex: 1,
          child: _buildExpressionPad(),
        ),
        Expanded(
          // Result Area - Mid - Medium Size Ratio
          flex: 3,
          child: _buildResultPad(),
        ),
        Expanded(
          // Controls Area - Bottom - Max Size Ration
          flex: 5,
          child: _buildButtons(),
        )
      ]),
    ));
  }
}

// Expression Area
Widget _buildExpressionPad() {
  return Container(
    margin: const EdgeInsets.only(left: 12.5, right: 12.5),
    decoration: const BoxDecoration(
      // Bottom Divider
      border: Border(
        bottom: BorderSide(
          color: Color.fromRGBO(227, 227, 227, 1),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          // Expression
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Row(
            children: <Widget>[
              Text(expression,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(152, 152, 152, 1),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          // Clear Btn
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(100.0),
                onTap: () => {
                  // _buttonPressed("×", isClear: true)
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  child: const Text(
                    "×",
                    style: TextStyle(
                        fontSize: 36,
                        color: Color.fromRGBO(200, 200, 200, 1),
                        fontWeight: FontWeight.w300),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

// Result pad
Widget _buildResultPad() {
  return Container(
    color: Colors.amber,
    alignment: Alignment.topLeft,
    child: Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
      child: Text(
        result,
        style: const TextStyle(
            color: Color.fromRGBO(227, 227, 227, 1),
            fontSize: 70,
            fontWeight: FontWeight.w400,
            fontFamily: 'Chivo'),
      ),
    ),
  );
}

// Grid of buttons
Widget _buildButtons() {
  return Material(
    color: const Color(0xFFF2F2F2),
    child: GridView.count(
        crossAxisCount: 4, // 4x4 grid
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        children: buttonNames.map<Widget>((e) {
          return _button(e);
        }).toList()),
  );
}

// Buttons
Widget _button(text) {
  return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          //_buttonPressed(text);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(94, 94, 94, 1),
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ));
}
