class GuidesModel {
  String? defaultLang;
  String? sId;
  String? category;
  String? image;
  int? iV;
  String? title;
  String? text;

  GuidesModel(
      {this.defaultLang,
      this.sId,
      this.category,
      this.image,
      this.iV,
      this.title,
      this.text});

  GuidesModel.fromJson(Map<String, dynamic> json) {
    defaultLang = json['defaultLang'];
    sId = json['_id'];
    category = json['category'];
    image = json['image'];
    iV = json['__v'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['defaultLang'] = defaultLang;
    data['_id'] = sId;
    data['category'] = category;
    data['image'] = image;
    data['__v'] = iV;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}

class GuidesArray {
  final List<GuidesModel> guidesList;

  GuidesArray({required this.guidesList});

  factory GuidesArray.fromJson(List<dynamic> json) {
    List<GuidesModel> guidesList = json.map((item) => GuidesModel.fromJson(item)).toList();
    return GuidesArray(guidesList: guidesList);
  }

  List<dynamic> toJson() {
    return guidesList.map((guides) => guides.toJson()).toList();
  }
}