// 测试mock 数据

// ignore_for_file: prefer_const_constructors

import 'package:flutter_application_1/http/core/hi_net_adapter.dart';
import 'package:flutter_application_1/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send<T>(BaseRequest request) {
    return Future<HiNetResponse>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": "success"},
          statusCode: 200,
          request: request,
          statusMessage: "success");
    });
  }
}
