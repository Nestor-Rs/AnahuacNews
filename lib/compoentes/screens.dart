import 'package:flutter/material.dart';
import 'package:anahuac_news/compoentes/zedess_api.dart';
import 'package:anahuac_news/compoentes/estilos/style_text.dart';
import 'package:anahuac_news/compoentes/estilos/themes.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          container(Text(
            'Login Anahuac News',
            style: titleStyle(),
          )),
          container(textImput('Usuario', false)),
          container(textImput('Contrasela', true)),
          container(buttonElevate('Iniciar sescion', () {}, normalButton())),
          container(buttonOutLined('Registrarse', () {}, normalButton())),
          container(buttonText('Olvide mi contraseña', () {}, normalButton())),
        ]),
      ),
    );
  }
}

