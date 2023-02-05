class UserModel {

  String? token;

  UserModel({this.token,});

  UserModel.fromJson(dynamic json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}