import 'package:fk_affiliate/src/models/image_urls.dart';

class OffersResponse {
  List<AllOffersList> allOffersList;

  OffersResponse({this.allOffersList});

  OffersResponse.fromJson(Map<String, dynamic> json) {
    if (json['allOffersList'] != null) {
      allOffersList = new List<AllOffersList>();
      json['allOffersList'].forEach((v) {
        allOffersList.add(new AllOffersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allOffersList != null) {
      data['allOffersList'] =
          this.allOffersList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllOffersList {
  int startTime;
  int endTime;
  String title;
  String name;
  String description;
  String url;
  String category;
  List<ImageUrls> imageUrls;
  String availability;

  AllOffersList(
      {this.startTime,
      this.endTime,
      this.title,
      this.name,
      this.description,
      this.url,
      this.category,
      this.imageUrls,
      this.availability});

  AllOffersList.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    title = json['title'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
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
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['title'] = this.title;
    data['name'] = this.name;
    data['description'] = this.description;
    data['url'] = this.url;
    data['category'] = this.category;
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls.map((v) => v.toJson()).toList();
    }
    data['availability'] = this.availability;
    return data;
  }
}
