class BlogsModel {
  String? type;
  String? message;
  BlogsData? data;


  BlogsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ?  BlogsData.fromJson(json['data']) : null;
  }

}

class BlogsData {
  List<Plants>? plants;
  List<Seeds>? seeds;
  List<Tools>? tools;


  BlogsData.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plants>[];
      json['plants'].forEach((v) {
        plants!.add( Plants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <Seeds>[];
      json['seeds'].forEach((v) {
        seeds!.add( Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <Tools>[];
      json['tools'].forEach((v) {
        tools!.add( Tools.fromJson(v));
      });
    }
  }
}

class Plants {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;


  Plants.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }


}

class Seeds {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;


  Seeds.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


}

class Tools {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;


  Tools.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}