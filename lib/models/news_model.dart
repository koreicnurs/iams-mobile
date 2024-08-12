class NewsModel {
  String? defaultLang;
  String? datetime;
  String? sId;
  String? image;
  int? iV;
  String? title;
  String? text;

  NewsModel({
    this.defaultLang,
    this.datetime,
    this.sId,
    this.image,
    this.iV,
    this.title,
    this.text,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      defaultLang: json['defaultLang'],
      datetime: json['datetime'],
      sId: json['_id'],
      image: json['image'],
      iV: int.tryParse(json['__v'].toString()) ?? 0,
      title: json['title'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'defaultLang': defaultLang,
      'datetime': datetime,
      '_id': sId,
      'image': image,
      '__v': iV,
      'title': title,
      'text': text,
    };
  }
}

class NewsResponse {
  final List<NewsModel> newsList;

  NewsResponse({required this.newsList});

  factory NewsResponse.fromJson(List<dynamic> json) {
    List<NewsModel> newsList = json.map((item) => NewsModel.fromJson(item)).toList();
    return NewsResponse(newsList: newsList);
  }

  List<dynamic> toJson() {
    return newsList.map((news) => news.toJson()).toList();
  }
}
