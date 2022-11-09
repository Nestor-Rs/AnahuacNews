import 'package:flutter/material.dart';

void changeScreen(BuildContext context, StatelessWidget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
