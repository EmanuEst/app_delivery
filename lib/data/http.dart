import 'dart:convert' as convert;

import 'package:app_delivery/models/categoria_model.dart';
import 'package:http/http.dart' as http;

Future<List<CategoriaModel>> listaCategorias() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  List<CategoriaModel> categorias = [];
  var url =
      Uri.http('192.168.205.253:1337', '/api/categorias', {'populate': '*'});

  // Await the http get response, then decode the json-formatted response.
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var listaResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      for (var categoria in listaResponse['data']) {
        CategoriaModel categoriaL = CategoriaModel.fromJson(categoria);
        categoria.add(categoriaL);
      }

      return categorias;
      /* var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');*/
    } else {
      print('Houve um erro: ${response.statusCode}.');
      return categorias;
    }
  } catch (erro) {
    print(erro);
  }
  return categorias;
}
