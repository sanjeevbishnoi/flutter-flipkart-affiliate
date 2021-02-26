import 'package:dio/dio.dart';
import 'package:fk_affiliate/src/env.dart';

import 'package:flutter/material.dart';

class ApiProvider {
  Dio _dio;

  void _setHeaders(Map<String, dynamic> config) {
    BaseOptions options = new BaseOptions(baseUrl: baseUrl, headers: {
      "$fkAffiliateId": config['$fkAffiliateId'],
      "$fkAffiliateToken": config['$fkAffiliateToken'],
      "Content-Type": "application/json",
    });
    this._dio = new Dio(options);
  }

  ApiProvider({@required Map<String, dynamic> config}) {
    _setHeaders(config);
  }

  void _printLog(String log) {
    print("FK_AFFILIATE LOG: $log");
  }

  // GET
  Future<dynamic> get(String url, Map<String, dynamic> queryParameters) async {
    try {
      Response response = await _dio.get(url, queryParameters: queryParameters);
      return response.data;
    } catch (error, stacktrace) {
      _printLog("$error stackTrace: $stacktrace");
      return null;
    }
  }

  // POST
  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response.data;
    } catch (error, stacktrace) {
      _printLog("$error stackTrace: $stacktrace");
      return null;
    }
  }
}
