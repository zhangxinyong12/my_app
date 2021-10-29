import 'package:flutter_application_1/http/core/hi_net.dart';
import 'package:flutter_application_1/http/request/base_request.dart';
import 'package:flutter_application_1/http/request/login_request.dart';
import 'package:flutter_application_1/http/request/registration_request.dart';

class LoginDao {
  static login(String name, String pwd) {
    return _send(name, pwd);
  }
 static register(String name, String pwd,int phone,int age) {
    return _send(name, pwd,phone: phone,age: age);
  }
  static _send(String name, String pwd, { phone, age}) async {
    BaseRequest request;
    if (phone != null && age != null) {
      request = RegistrationRequest();
       request
        .add("name", name)
        .add("pwd", pwd)
        .add("phone", phone)
        .add("age", age);
    } else {
      request = LoginRequest();
       request
        .add("name", name)
        .add("pwd", pwd);
    }
   
    var result = await HiNet.getInstance().fire(request);
    return result;
  }
}
