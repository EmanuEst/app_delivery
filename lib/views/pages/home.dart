import 'package:flutter/material.dart';
import '../../data/http.dart';
import '../../models/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<CategoriaModel>> _categorias;

  @override
  void initState() {
    super.initState();
    _categorias = listaCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: _categorias,
          builder: (context, snapshot) {
            var dados = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: dados!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Image.network(
                            'http:/192.168.205.253:1337${dados[index].img}',
                            width: 65,
                            height: 65,
                          ),
                          Column(
                            children: [
                              Text(dados[index].categoria),
                              Text('${dados[index].total} Produtos'),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
