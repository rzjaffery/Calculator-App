import 'package:flutter/material.dart';

Widget buildButton(void Function(String) onClickButton) {
  return Column(
    children: [
      buildRow(["C", "DEL", "/", "*"], onClickButton),
      buildRow(["7", "8", "9", "-"], onClickButton),
      buildRow(["4", "5", "6", "+"], onClickButton),
      buildRow(["1", "2", "3", "="], onClickButton),
      buildRow(["0", "."], onClickButton),
    ],
  );
}

Widget buildRow(List<String> buttons, void Function(String) onClickButton) {
  return Row(
    children: buttons.map((text) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () => onClickButton(text),
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    }).toList(),
  );
}
