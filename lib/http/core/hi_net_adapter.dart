import 'dart:convert';

import 'package:flutter_application_1/http/request/base_request.dart';

// 统一的网络返回格式
class HiNetResponse<T> {
  T data;
  BaseRequest request;
  int statusCode;
  String statusMessage;
  dynamic extra;

  HiNetResponse({
    required this.data,
    required this.statusCode,
    required this.statusMessage,
    required this.request,
    dynamic? extra,
  });

  @override
  String toString() {
    if (data is Map) {
      return jsonEncode(data);
    }
    return data.toString();
  }
}

// 网络请求抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse> send<T>(BaseRequest request);
}
