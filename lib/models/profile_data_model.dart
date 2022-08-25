
class ProfileDataModel {
  String? type;
  String? message;
  ProfileData? data;


  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ?  ProfileData.fromJson(json['data']) : null;
  }


}

class ProfileData {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  Null? address;
  String? role;
  Null? userPoints;


  ProfileData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];

  }


}