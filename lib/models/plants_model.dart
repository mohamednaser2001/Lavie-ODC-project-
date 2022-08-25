


class PlantsModel {
  String? type;
  String? message;
  List<PlantsData>? data;


  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PlantsData>[];
      json['data'].forEach((v) {
        data!.add( PlantsData.fromJson(v));
      });
    }
  }


}

class PlantsData {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;


  PlantsData.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}