import 'package:flutter_application_1/http/core/hi_error.dart';
import 'package:flutter_application_1/http/core/hi_net_adapter.dart';
import 'package:flutter_application_1/http/core/mock_adapter.dart';
import 'package:flutter_application_1/http/request/base_request.dart';

import 'dio_adapter.dart';

class HiNet {
  HiNet._();
  static HiNet? _instance;
  static HiNet getInstance() {
    // 左边如果为空返回右边的值，否则不处理。
    _instance ??= HiNet._();
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      // 其他异常
      error = e;
      printLog(error);
    }

    var result = response!.data;
    printLog(result);
    var status = response.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw HiNetError(status, result.toString(), data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    HiNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print("hi_net:${log.toString()}");
  }
}
