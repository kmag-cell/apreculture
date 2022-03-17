class StockModel {
  int? id;
  String? clientName;
  String? numero;
  String? imageCulture;
  String? name;
  String? price;
  String? origin;
  String? quantite;

  StockModel(
      {this.id,
      this.clientName,
      this.numero,
      this.imageCulture,
      this.name,
      this.price,
      this.origin,
      this.quantite});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientName = json['client_name'];
    numero = json['numero'];
    imageCulture = json['image_culture'];
    name = json['name'];
    price = json['price'];
    origin = json['origin'];
    quantite = json['quantite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_name'] = clientName;
    data['numero'] = numero;
    data['image_culture'] = imageCulture;
    data['name'] = name;
    data['price'] = price;
    data['origin'] = origin;
    data['quantite'] = quantite;
    return data;
  }
}
