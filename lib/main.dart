import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/hi_cache.dart';
import 'package:flutter_application_1/http/core/hi_error.dart';
import 'package:flutter_application_1/http/core/hi_net.dart';
import 'package:flutter_application_1/http/dao/login_dao.dart';
import 'package:flutter_application_1/http/request/test_request.dart';
import 'package:flutter_application_1/page/login_page.dart';

import 'package:flutter_application_1/page/registration_page.dart';
import 'package:flutter_application_1/util/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int n = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    await HiCache.preInit();
    n = HiCache.getInstance().get("n") ?? 0;
    setState(() {
      n = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DEMO",
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: LoginPage(onJumpToLogin: () {}),
    );
  }

  void getData() async {
    // 测试接口

    var result;

    try {
      result = await LoginDao.login("zhangsan002", "zhang");
    } on NeedAuth catch (e) {
      print("NeedAuth:${e}");
    } on NeedLogin catch (e) {
      print("NeedLogin:${e}");
    } on HiNetError catch (e) {
      print("HiNetError 其他错误:${e}");
    }
    print(result);
  }

  void testCach() {
    HiCache.getInstance().setString("aa", "aaaaaaaaa");
    var value = HiCache.getInstance().get("aa");
    print("aa:$value");
  }

  void testDio() async {
    var result;
    try {
      result = await HiNet.getInstance().fire(TestRequest());
    } on NeedAuth catch (e) {
      print("NeedAuth:${e}");
    } on NeedLogin catch (e) {
      print("NeedLogin:${e}");
    } on HiNetError catch (e) {
      print("HiNetError 其他错误:${e}");
    }
    print(result);
  }
}
