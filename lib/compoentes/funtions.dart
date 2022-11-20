import 'package:anahuac_news/compoentes/objetos/noticia.dart';
import 'package:anahuac_news/compoentes/screens.dart';
import 'package:anahuac_news/compoentes/zedess_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

List<Card> getNews() {
  List<Card> n = [];
  db.collection("News").get().then(
    (res) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> lDocs = res.docs;
      for (var i = 0; i < lDocs.length; i++) {
        Noticias nowNew = Noticias(lDocs[i].data()["title"],
            lDocs[i].data()["text"], lDocs[i].data()["img"]);
        n.add(outLineCard(nowNew.title, nowNew.text, nowNew.img));
        print(nowNew.title + nowNew.text + nowNew.img);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return n;
}
