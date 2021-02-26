import 'package:cached_network_image/cached_network_image.dart';
import 'package:fk_affiliate/fk_affiliate.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:example/fk/fk.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<AllOffersList> _allOffersList = [];
  bool isDark = false;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOffers();
  }

  getOffers() async {
    OffersResponse offersResponse = await fkAffiliate((api) => api.getOffers());
    isLoading = false;
    //print(offersResponse.allOffersList);
    if (offersResponse != null && offersResponse.allOffersList.length > 0) {
      this.setState(() {
        _allOffersList = offersResponse.allOffersList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    if (themeData.brightness == Brightness.dark) {
      isDark = true;
    }
    return Container(
        //margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _allOffersList.length,
                itemBuilder: (BuildContext context, int i) {
                  AllOffersList allOffersList = _allOffersList[i];
                  return GestureDetector(
                    onTap: () {
                      String url = allOffersList.url;
                      // url = url.replaceAll(
                      //     'www.flipkart.com', 'dl.flipkart.com/dl');
                      _launchURL(url);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.25,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Expanded(
                                  child: CachedNetworkImage(
                                imageUrl: allOffersList.imageUrls[1].url == null
                                    ? ''
                                    : allOffersList.imageUrls[1].url,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.00,
                                ),
                                child: Text(
                                  "${allOffersList.name}",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 14.00,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isDark ? Colors.amber : Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  "${allOffersList.title}",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 14.00,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.green),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.00,
                                ),
                                child: Text(
                                  "${allOffersList.description == null ? 'No Description' : allOffersList.description}",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 14.00,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
