import 'package:calculator_app/screens/build_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 170, 255),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: Text(
                result,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          buildButton(onClickButton),
        ],
      ),
    );
  }

  void onClickButton(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        input = "";
        result = "0";
        return;
      }

      if (buttonText == "DEL") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
        result = input.isEmpty ? "0" : input;
        return;
      }

      if (buttonText == "=") {
        _resetAfterEqual();
        return;
      }

      input += buttonText;
      result = input;
    });
  }

  void _resetAfterEqual() {
    input = "";
    result = "0";
  }

  String _evaluateExpression(String expression) {
    if (expression.isEmpty) {
      return "0";
    }

    final operatorMatch = RegExp(r'[\+\-\*/]').firstMatch(expression);
    if (operatorMatch == null) {
      return expression;
    }

    final operatorIndex = operatorMatch.start;
    final operator = expression[operatorIndex];
    final leftPart = expression.substring(0, operatorIndex);
    final rightPart = expression.substring(operatorIndex + 1);

    final leftValue = double.tryParse(leftPart);
    final rightValue = double.tryParse(rightPart);

    if (leftValue == null || rightValue == null) {
      return "Error";
    }

    double computedResult;

    switch (operator) {
      case "+":
        computedResult = leftValue + rightValue;
        break;
      case "-":
        computedResult = leftValue - rightValue;
        break;
      case "*":
        computedResult = leftValue * rightValue;
        break;
      case "/":
        if (rightValue == 0) {
          return "Error";
        }
        computedResult = leftValue / rightValue;
        break;
      default:
        return "Error";
    }

    if (computedResult % 1 == 0) {
      return computedResult.toInt().toString();
    }

    return computedResult.toString();
  }
}

