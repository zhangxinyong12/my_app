import 'package:flutter/material.dart';
import 'package:flutter_application_1/http/dao/login_dao.dart';
import 'package:flutter_application_1/util/string_util.dart';
import 'package:flutter_application_1/widget/appbar.dart';
import 'package:flutter_application_1/widget/login_button.dart';
import 'package:flutter_application_1/widget/login_effect.dart';
import 'package:flutter_application_1/widget/login_input.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onJumpToLogin;

  LoginPage({Key? key, this.onJumpToLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("登录", "注册", widget.onJumpToLogin ?? () {}),
      body: Container(
        child: ListView(
          children: [
            LoginEffect(
              protect: protect,
            ),
            LoginInput(
              "用户名",
              "请输入用户名",
              onChanged: (text) {
                userName = text;
                checkInput();
              },
            ),
            LoginInput(
              "密码",
              "请输入密码",
              lineStretch: true,
              obscureText: true,
              onChanged: (text) {
                password = text;
                checkInput();
              },
              focusChanged: (foncus) {
                setState(() {
                  protect = foncus;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: LoginButton(
                '登录',
                enable: loginEnable,
                onPressed: send,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkParams() {
    String tips;
    if (password == null) {
      tips = "请输入密码";
      print(tips);
      return;
    } else if (userName == null) {
      tips = "请输入用户名";
      print(tips);
      return;
    }
    send();
  }

  void send() async {
    try {
      var result = await LoginDao.login(userName!, password!);
      print("login result:$result");
      // Fluttertoast.showToast(
      //   msg: "login result:$result",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM_LEFT,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );

      GFToast.showToast(
        'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
        context,
      );
    } catch (e) {
      print("login error:$e");
      Fluttertoast.showToast(
        msg: "login error:$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void checkInput() {
    bool enable = false;
    if (isNotEmpty(userName ?? '') && isNotEmpty(password ?? '')) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }
}
