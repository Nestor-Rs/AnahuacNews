import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anahuac_news/compoentes/zedess_api.dart';
import 'package:anahuac_news/compoentes/estilos/style_text.dart';
import 'package:anahuac_news/compoentes/estilos/themes.dart';
import 'package:anahuac_news/compoentes/funtions.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ------------------------------Variables------------------------------
List<Card> noticias = [];
FirebaseFirestore db = FirebaseFirestore.instance;

// ------------------------------Login------------------------------
class Login extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    noticias = getNews();
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      key: formKey,
      /*
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),*/
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Login Anahuac News',
            style: titleStyle(),
          )),
          container(textImput('Usuario', false, emailTextController)),
          container(textImput('Contraseña', true, passwordTextController)),
          //----
          container(buttonElevate('Iniciar sesión', () {
            FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailTextController.text,
                password: passwordTextController.text)
            .then((value) {
              changeScreen(context, Home(), 2);
              Fluttertoast.showToast(
                  msg: "Inicio de sesión exitoso",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 12.0);
            })
            .onError((error, stackTrace) {
              Fluttertoast.showToast(
                  msg: "No se pudo iniciar la sesión, intente de nuevo.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 12.0);
            });
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
            "La siguiente aplicación se encuentra bajo la licencia GNU. \n Por: \n Nestor Rodriguez Salgado \n Alonso Perez Flores",
            style: textStyle(),
          )),
          container(buttonElevate("Cerrar Sesión", (){
            FirebaseAuth.instance.signOut().then((value) {
              changeScreen(context, Login(), 2);
              Fluttertoast.showToast(
                  msg: "Se cerró la sesión.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 12.0);
            });
          },
              normalButton())),
        ]),
      ),
    );
  }
}

//------------------------------RecuperarContraseña------------------------------
class RecuperarContrasena extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
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
          container(textImput('correo electronico', false, mailController)),
          container(
              buttonElevate('Recuperar contraseña', () {
                FirebaseAuth.instance.sendPasswordResetEmail(
                    email: mailController.text)
                .then((value) {
                  changeScreen(context, Login(), 2);
                  Fluttertoast.showToast(
                      msg: "Se ha enviado un correo de recuperación.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 12.0);
                });
              }, normalButton())),
        ]),
      ),
    );
  }
}

//------------------------------Registrarse------------------------------
class Registrar extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController mailAnahuac = TextEditingController();
  TextEditingController contrasennia = TextEditingController();
  TextEditingController confirmarContra = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anahuac News'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          container(Text(
            'Registrate',
            style: titleStyle(),
          )),
          container(textImput('Correo Anahuac', false, mailAnahuac)),
          container(textImput('Contraseña', true, contrasennia)),
          container(textImput('Confirmar contraseña', true, confirmarContra)),
          container(buttonElevate('Registrarse', () {
            if(contrasennia.text != confirmarContra.text){
              return Fluttertoast.showToast(
                        msg: "Las contraseñas no coinciden.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 12.0);
            }
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: mailAnahuac.text,
                password: confirmarContra.text)
                .then((value) {
                changeScreen(context, Login(), 2);

                Fluttertoast.showToast(
                    msg: "Cuenta creada exitosamente.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    fontSize: 12.0);
            })
                .onError((error, stackTrace){
                    Fluttertoast.showToast(
                        msg: "Ha ocurrido un error, intente de nuevo.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 12.0);
            });
          }, normalButton())),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeScreen(context, Informacion(), 1);
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.perm_device_info_outlined),
      ),
      body: Center(
        child: ListView(children: noticias),
      ),
    );
  }
}
