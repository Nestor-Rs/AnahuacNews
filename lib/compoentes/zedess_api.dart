import 'package:flutter/material.dart';

TextStyle titleStyle() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
}

TextStyle textStyle() {
  return TextStyle(fontSize: 20);
}

TextField textImput(String label, bool segurity) {
  return new TextField(
    obscureText: segurity,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
    ),
  );
}

ElevatedButton buttonElevate(String label, final action) {
  return ElevatedButton(onPressed: action, child: Text(label));
}

OutlinedButton buttonOutLined(String label, final action) {
  return OutlinedButton(onPressed: action, child: Text(label));
}

TextButton buttonText(String label, final action) {
  return TextButton(onPressed: action, child: Text(label));
}

IconButton buttonIcon(Icon icon, final action) {
  return IconButton(onPressed: action, icon: icon);
}

Container container(Widget myWidget) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(20),
    child: myWidget,
  );
}
