import 'package:flutter/material.dart';

void changeScreen(
    BuildContext context, StatelessWidget screen, int typeChange) {
  switch (typeChange) {
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      break;
    case 2:
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) => screen)),
        ModalRoute.withName('/'),
      );
      break;
  }
}

String validate(String value) {
  if (value.length == 0) {
    return 'Por favor ingrese un formato valido';
  } else {
    return '';
  }
}
