// dio 适配器
import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/core/hi_error.dart';
import 'package:flutter_application_1/http/core/hi_net_adapter.dart';
import 'package:flutter_application_1/http/request/base_request.dart';

class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send<T>(BaseRequest request) async {
    request.useHttps = false;
    var response, options = Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio().post(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio().delete(request.url(), options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }

    if (error != null) {
      // 抛出异常
      throw HiNetError(response?.statusCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }

  HiNetResponse buildRes(Response response, BaseRequest request) {
    return HiNetResponse(
        data: response.data,
        statusCode: response.statusCode ?? -1,
        statusMessage: response.statusMessage ?? "unnow",
        request: request);
  }
}
