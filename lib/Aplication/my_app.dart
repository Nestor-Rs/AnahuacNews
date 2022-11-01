import 'package:flutter/material.dart';
import 'package:anahuac_news/compoentes/zedess_api.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anahuac News",
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anahuac News'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            container(textImput('Usuario', false)),
            container(textImput('Contrasela', true)),
            container(buttonElevate('Iniciar sescion', () {})),
          ]),
        ),
      ),
    );
  }
}
