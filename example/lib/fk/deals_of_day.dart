import 'package:cached_network_image/cached_network_image.dart';
import 'package:fk_affiliate/fk_affiliate.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:example/fk/fk.dart';

class DOD extends StatefulWidget {
  @override
  _DODState createState() => _DODState();
}

class _DODState extends State<DOD> {
  List<DotdList> _dotdList = [];
  bool isDark = false;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDOD();
  }

  getDOD() async {
    DODResponse dodResponse = await fkAffiliate((api) => api.getDOD());
    isLoading = false;
    //print(offersResponse.allOffersList);
    if (dodResponse != null && dodResponse.dotdList.length > 0) {
      this.setState(() {
        _dotdList = dodResponse.dotdList;
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
                itemCount: _dotdList.length,
                itemBuilder: (BuildContext context, int i) {
                  DotdList dodList = _dotdList[i];
                  return GestureDetector(
                    onTap: () {
                      String url = dodList.url;
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
                                imageUrl: dodList.imageUrls[1].url == null
                                    ? ''
                                    : dodList.imageUrls[1].url,
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
                                  "${dodList.name}",
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
                                  "${dodList.title}",
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
                                  "${dodList.description == null ? 'No Description' : dodList.description}",
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
