import 'package:flutter/material.dart';

TextField textImput(String label) {
  return new TextField(
    obscureText: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
    ),
  );
}


