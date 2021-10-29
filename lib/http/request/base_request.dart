enum HttpMethod {
  GET,
  POST,
  DELETE,
}

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;
  // "http://192.168.48.103:3000/"; // 不能写localhost，会报错

  String authority() {
    return "192.168.48.201:3000";
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathParams = "${path()}$pathParams";
      } else {
        pathParams = "${path()}$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    return uri.toString();
  }

  bool neddLogin();
  Map<String, String> params = Map();
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = Map();
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
