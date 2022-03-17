class UserModel {
  UserData? userData;

  UserModel({this.userData});

  UserModel.fromJson(Map<String, dynamic> json) {
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? number;
  String? location;

  UserData({this.firstName, this.lastName, this.username, this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    number = json['number'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['number'] = number;
    data['location'] = location;
    return data;
  }
}
