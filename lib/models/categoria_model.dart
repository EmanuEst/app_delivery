class CategoriaModel {
  int id;
  String categoria;
  String img;
  int total;

  CategoriaModel(this.id, this.categoria, this.img, this.total);

  factory CategoriaModel.fromJson(dynamic json) {
    return CategoriaModel(
      json['id'] as int,
      json['attributes']['categoria'] as String,
      json['attributes']['imagem']['data']['attributes']['formats']['thumbnail']
          ['url'] as String,
      json['attributes']['total'] as int,
    );
  }
}
