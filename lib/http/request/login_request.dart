import 'package:flutter_application_1/http/request/base_request.dart';

class LoginRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool neddLogin() {
    return false;
  }

  @override
  String path() {
    return "/user/login";
  }
}
