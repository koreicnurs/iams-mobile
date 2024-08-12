class AlertsNewsModel {
  String? sId;
  String? datetime;
  String? image;
  String? title;
  String? text;

  AlertsNewsModel({this.sId, this.datetime, this.image, this.title, this.text});

  AlertsNewsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    datetime = json['datetime'];
    image = json['image'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['datetime'] = datetime;
    data['image'] = image;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}

class AlertsNewsArray {
  final List<AlertsNewsModel> alertsNewsList;

  AlertsNewsArray({required this.alertsNewsList});

  factory AlertsNewsArray.fromJson(List<dynamic> json) {
    List<AlertsNewsModel> alertsNewsList = json.map((item) => AlertsNewsModel.fromJson(item)).toList();
    return AlertsNewsArray(alertsNewsList: alertsNewsList);
  }

  List<dynamic> toJson() {
    return alertsNewsList.map((news) => news.toJson()).toList();
  }
}
