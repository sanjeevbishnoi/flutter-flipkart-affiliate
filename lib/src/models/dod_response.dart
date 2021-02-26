import 'package:fk_affiliate/src/models/image_urls.dart';

class DODResponse {
  List<DotdList> dotdList;

  DODResponse({this.dotdList});

  DODResponse.fromJson(Map<String, dynamic> json) {
    if (json['dotdList'] != null) {
      dotdList = new List<DotdList>();
      json['dotdList'].forEach((v) {
        dotdList.add(new DotdList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dotdList != null) {
      data['dotdList'] = this.dotdList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DotdList {
  String name;
  String title;
  String description;
  String url;
  List<ImageUrls> imageUrls;
  String availability;

  DotdList(
      {this.name,
      this.title,
      this.description,
      this.url,
      this.imageUrls,
      this.availability});

  DotdList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    if (json['imageUrls'] != null) {
      imageUrls = new List<ImageUrls>();
      json['imageUrls'].forEach((v) {
        imageUrls.add(new ImageUrls.fromJson(v));
      });
    }
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls.map((v) => v.toJson()).toList();
    }
    data['availability'] = this.availability;
    return data;
  }
}
