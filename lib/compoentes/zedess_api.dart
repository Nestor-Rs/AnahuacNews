import 'package:flutter/material.dart';

TextField textImput(String label, bool segurity) {
  return new TextField(
    obscureText: segurity,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
    ),
  );
}

ElevatedButton buttonElevate(String label, final action, ButtonStyle style) {
  return ElevatedButton(
    onPressed: action,
    child: Text(label),
    style: style,
  );
}

OutlinedButton buttonOutLined(String label, final action, ButtonStyle style) {
  return OutlinedButton(onPressed: action, child: Text(label), style: style,);
}

TextButton buttonText(String label, final action, ButtonStyle style) {
  return TextButton(onPressed: action, child: Text(label), style: style,);
}

IconButton buttonIcon(Icon icon, final action, ButtonStyle style) {
  return IconButton(onPressed: action, icon: icon,style: style,);
}

Container container(Widget myWidget) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(20),
    child: myWidget,
  );
}
