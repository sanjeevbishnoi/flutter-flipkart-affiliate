library fk_affiliate;

import 'package:fk_affiliate/src/models/dod_response.dart';
import 'package:fk_affiliate/src/models/offers_response.dart';
import 'package:fk_affiliate/src/networking/api_provider.dart';
import 'package:flutter/material.dart';
export 'src/env.dart';
export 'src/models/offers_response.dart';
export 'src/models/dod_response.dart';

class FKAffiliate {
  ApiProvider _apiProvider;
  Map<String, dynamic> config;
  static FKAffiliate getInstance({Map<String, dynamic> config}) {
    FKAffiliate fkAffiliate = new FKAffiliate._internal();
    fkAffiliate._setApp(config: config);
    fkAffiliate._init();
    return fkAffiliate;
  }

  FKAffiliate._internal();

  Future _setApp({@required Map<String, dynamic> config}) async {
    this.config = config;
  }

  void _init() {
    _apiProvider = new ApiProvider(config: this.config);
  }

  Future<OffersResponse> getOffers() async {
    return OffersResponse.fromJson(
        await _apiProvider.get("offers/v1/all/json", {}));
  }

  Future<DODResponse> getDOD() async {
    return DODResponse.fromJson(
        await _apiProvider.get("offers/v1/dotd/json", {}));
  }
}
