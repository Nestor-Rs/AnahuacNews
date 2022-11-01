import 'package:flutter/material.dart';
import 'package:anahuac_news/compoentes/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anahuac News",
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.dark),
      home: Login(),
    );
  }
}
