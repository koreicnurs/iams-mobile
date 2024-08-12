class AboutModel {
  String? defaultLang;
  String? datetime;
  String? sId;
  int? iV;
  String? description;

  AboutModel(
      {this.defaultLang, this.datetime, this.sId, this.iV, this.description});

  AboutModel.fromJson(Map<String, dynamic> json) {
    defaultLang = json['defaultLang'];
    datetime = json['datetime'];
    sId = json['_id'];
    iV = json['__v'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['defaultLang'] = defaultLang;
    data['datetime'] = datetime;
    data['_id'] = sId;
    data['__v'] = iV;
    data['description'] = description;
    return data;
  }
}
