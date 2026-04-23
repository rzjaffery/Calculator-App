import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(CalculatorApp ());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}