import 'package:flutter_application_1/http/request/base_request.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool neddLogin() {
    return true;
  }

  @override
  String path() {
    return '/app/api';
  }
}
