import 'package:anahuac_news/compoentes/estilos/themes.dart';
import 'package:flutter/material.dart';

ButtonStyle redButton() {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.red));
}

ButtonStyle normalButton() {
  return ButtonStyle();
}

ButtonStyle redTextButton() {
  return TextButton.styleFrom(foregroundColor: Colors.red);
}
