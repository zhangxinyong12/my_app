import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/hi_cache.dart';
import 'package:flutter_application_1/http/core/hi_error.dart';
import 'package:flutter_application_1/http/core/hi_net.dart';
import 'package:flutter_application_1/http/dao/login_dao.dart';
import 'package:flutter_application_1/http/request/test_request.dart';

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
    n = HiCache.getInstance().get("n");
    setState(() {
      n = n;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DEMO",
      home: Scaffold(
        appBar: AppBar(
          title: Text("demo'"),
        ),
        body: Container(
          child: Row(
            children: [
              TextButton(onPressed: () {}, child: Text(n.toString())),
              InkWell(
                child: Text("测试"),
                onTap: () {
                  setState(() {
                    n++;
                    HiCache.getInstance().setInt("n", n);
                  });
                  getData();
                 // testCach();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
 // 测试接口

    var result ;

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
}
