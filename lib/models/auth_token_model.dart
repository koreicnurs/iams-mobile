class AuthToken {
  User? user;
  String? token;

  AuthToken({this.user, this.token});

  AuthToken.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? language;
  bool? pushReceive;
  List<String>? groups;
  List<dynamic>? latlng;
  String? sId;
  int? number;
  int? iV;

  User(
      {this.language,
      this.pushReceive,
      this.groups,
      this.latlng,
      this.sId,
      this.number,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    pushReceive = json['pushReceive'];
    groups = json['groups'].cast<String>();
    if (json['latlng'] != null) {
      latlng = <Null>[];
      json['latlng'].forEach((v) {
        latlng!;
      });
    }
    sId = json['_id'];
    number = json['number'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    return data;
  }
}
