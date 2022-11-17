import 'package:anahuac_news/compoentes/estilos/style_text.dart';
import 'package:anahuac_news/compoentes/funtions.dart';
import 'package:flutter/material.dart';

TextFormField textImput(String label, bool segurity) {
  return new TextFormField(
    obscureText: segurity,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
    ),
    //validator: validate,
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
  return OutlinedButton(
    onPressed: action,
    child: Text(label),
    style: style,
  );
}

TextButton buttonText(String label, final action, ButtonStyle style) {
  return TextButton(
    onPressed: action,
    child: Text(label),
    style: style,
  );
}

IconButton buttonIcon(Icon icon, final action, ButtonStyle style) {
  return IconButton(
    onPressed: action,
    icon: icon,
    style: style,
  );
}

Container container(Widget myWidget) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(15),
    child: myWidget,
  );
}

Image imagen(String imagen) {
  return Image(
    image: NetworkImage(imagen),
  );
}

Card outLineCard(String titulo, String contenido, String img) {
  return new Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            titulo,
            style: titleStyle(),
          ),
        ),
        container(Text(
          contenido,
          style: textStyle(),
        )),
        container(imagen(img))
      ],
    ),
  );
}