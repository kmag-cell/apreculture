class ImgPredModel {
  int? id;
  String? imagePred;
  NamePrediction? namePrediction;

  ImgPredModel({this.id, this.imagePred, this.namePrediction});

  ImgPredModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePred = json['image_pred'];
    namePrediction = json['name_prediction'] != null
        ? NamePrediction.fromJson(json['name_prediction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_pred'] = imagePred;
    if (namePrediction != null) {
      data['name_prediction'] = namePrediction!.toJson();
    }
    return data;
  }
}

class NamePrediction {
  int? id;
  String? nameCulture1;
  int? nitrogen;
  int? phosphor;
  int? potassium;
  int? temperature;
  int? humidity;
  int? rainfall;
  int? ph;
  int? user;

  NamePrediction(
      {this.id,
      this.nameCulture1,
      this.nitrogen,
      this.phosphor,
      this.potassium,
      this.temperature,
      this.humidity,
      this.rainfall,
      this.ph,
      this.user});

  NamePrediction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCulture1 = json['name_culture1'];
    nitrogen = json['nitrogen'];
    phosphor = json['phosphor'];
    potassium = json['potassium'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    rainfall = json['rainfall'];
    ph = json['ph'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_culture1'] = nameCulture1;
    data['nitrogen'] = nitrogen;
    data['phosphor'] = phosphor;
    data['potassium'] = potassium;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['rainfall'] = rainfall;
    data['ph'] = ph;
    data['user'] = user;
    return data;
  }
}
