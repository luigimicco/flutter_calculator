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
  "+",
  "±",
  "(",
  ")",
  "="
];

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: <Widget>[
        _buildButtons(),
      ]),
    ));
  }

  // Grid of buttons
  Widget _buildButtons() {
    return Material(
      color: const Color(0xFFF2F2F2),
      child: GridView.count(
          crossAxisCount: 4, // 5x4 grid
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: buttonNames.map<Widget>((caption) {
            return _button(caption);
          }).toList()),
    );
  }

  // Buttons
  Widget _button(text) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            // event on press
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ));
  }
}
