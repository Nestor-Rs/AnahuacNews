import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:anahuac_news/compoentes/zedess_api.dart';
import 'package:anahuac_news/compoentes/estilos/style_text.dart';
import 'package:anahuac_news/compoentes/estilos/themes.dart';
import 'package:anahuac_news/compoentes/funtions.dart';

// ------------------------------Login------------------------------
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Login Anahuac News',
            style: titleStyle(),
          )),
          container(textImput('Usuario', false)),
          container(textImput('Contrasela', true)),
          //----
          container(buttonElevate('Iniciar sescion', () {
            changeScreen(context, Home(), 2);
          }, normalButton())),
          //----
          container(buttonOutLined('Registrarse', () {
            changeScreen(context, Registrar(), 1);
          }, normalButton())),
          //----
          container(buttonText('Olvide mi contraseña', () {
            changeScreen(context, RecuperarContrasena(), 1);
          }, normalButton())),
        ]),
      ),
    );
  }
}

//------------------------------Informacion------------------------------
class Informacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Informacion de aplicacion',
            style: titleStyle(),
          )),
          container(Text(
            "La siguiente aplicacion se cuentra bajo la licencia GNU. \n Por: \n Nestor Rodriguez Salgado \n Alonso Perez Flores",
            style: textStyle(),
          )),
        ]),
      ),
    );
  }
}

//------------------------------RecuperarContraseña------------------------------
class RecuperarContrasena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Recupera tu contraseña',
            style: titleStyle(),
          )),
          container(textImput('correo electronico', false)),
          container(
              buttonElevate('Recuperar contraseña', () {}, normalButton())),
        ]),
      ),
    );
  }
}

//------------------------------Registrarse------------------------------
class Registrar extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Recupera tu contraseña',
            style: titleStyle(),
          )),
          container(textImput('Correo Anahuac', false)),
          container(textImput('Contraseña', true)),
          container(textImput('Repite contraseña', true)),
          container(buttonElevate('Registrarse', () {}, normalButton())),
        ]),
      ),
    );
  }
}

//------------------------------Home------------------------------
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[outLineCard()]),
      ),
    );
  }
}
