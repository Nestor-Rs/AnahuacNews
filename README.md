# Anahuac News

Este es un proyecto hecho en flutter, como proyecto independiente a la organización.

Para este proyecto se creó una API que encapsula varios componentes de flutter, esta API está en la carpeta de "componentes".

Lo que permite esta API:

* Obtener componentes como botones, textos, contenedores, imágenes y cartas.

* También las funciones más comunes usadas, como son el cambio de pantalla y obtener las noticias.

* También los estilos fueron empaquetados, lo que permiten cambiar los estilos de textos y botones.

Se añadió un objeto especial para tener las noticias.

Los principales componentes de las noticias son:

* Título
* Texto
* Imagen

Todos estos componentes son cadenas de texto.

## Funciones de relevancia

## Cargar imagen

En caso de no encontrar una imagen se carga una por defecto

~~~dart
Image imagen(String imagen) {
  if (imagen.isEmpty) {
    return Image(
        image: NetworkImage(
            'https://yt3.ggpht.com/ytc/AMLnZu8bmT1HUchRXoBXQOr9xzEnrl3l41eSSvwjUhtCPg=s900-c-k-c0x00ffffff-no-rj'));
  } else {
    return Image(
      image: NetworkImage(imagen),
    );
  }
}

~~~

## Obtener noticias

Se obtiene la lista de las noticias de Firebase y se usa un Objeto Noticia, para añadirlo a una lista, por último se retorna esta lista.

~~~dart
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
~~~
