class ImageUrls {
  String url;
  String resolutionType;

  ImageUrls({this.url, this.resolutionType});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    resolutionType = json['resolutionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['resolutionType'] = this.resolutionType;
    return data;
  }
}
