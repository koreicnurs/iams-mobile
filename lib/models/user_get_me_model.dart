class UserGetMe {
  String? language;
  bool? pushReceive;
  List<String>? groups;
  List? latlng;
  String? sId;
  int? number;
  int? iV;

  UserGetMe(
      {this.language,
      this.pushReceive,
      this.groups,
      this.latlng,
      this.sId,
      this.number,
      this.iV});

  UserGetMe.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    pushReceive = json['pushReceive'];
    groups = json['groups'].cast<String>();
    if (json['latlng'] != null) {
      latlng = [];
      json['latlng'].forEach((v) {
        latlng;
      });
    }
    sId = json['_id'];
    number = json['number'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = language;
    data['pushReceive'] = pushReceive;
    data['groups'] = groups;
    if (latlng != null) {
      data['latlng'] = latlng;
    }
    data['_id'] = sId;
    data['number'] = number;
    data['__v'] = iV;
    return data;
  }
}
