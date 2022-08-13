import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

List buttonNames = [
  "7",
  "8",
  "9",
  "/",
  "4",
  "5",
  "6",
  "*",
  "1",
  "2",
  "3",
  "-",
  "0",
  ".",
  "C",
  "+",
  "±",
  "(",
  ")",
  "="
];

String expression = "0";

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    // Bottom Divider
                    border: Border.all(
                      color: Colors.green,
                      width: 1,
                    ), //Border.all
                  ),
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                    child: Text(
                      expression,
                      style: const TextStyle(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          fontSize: 48,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
            ),
            Expanded(flex: 3, child: _buildButtons()),
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
            _buttonPressed(text);
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

  void _buttonPressed(String text) {
    setState(() {
      if (text == "=") {
        expression = _evaluateEquation(expression);
      } else if (text == "C") {
        // Backspace
        expression = expression.substring(0, expression.length - 1);
        if (expression == "") expression = "0"; // If all empty
      } else if (text == "±") {
        // Plus/Minus
        if (expression != "0") {
          if (expression.substring(0, 1) != "-") {
            expression = "-$expression";
          } else {
            expression = expression.substring(1);
          }
        }
      } else {
        // Default
        if (expression == "0" && text != ".") expression = "";
        expression += text;
      }
    });
  }

  String _evaluateEquation(String formula) {
    try {
      Expression exp = (Parser()).parse(formula);

      double res = double.parse(
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString());

      // Output correction for decimal results
      return double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
          ? res.toStringAsFixed(0)
          : res.toStringAsFixed(4);
    } catch (e) {
      return "Errore";
    }
  }
}
