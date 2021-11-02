import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/http/core/hi_error.dart';
import 'package:flutter_application_1/http/dao/login_dao.dart';
import 'package:flutter_application_1/util/string_util.dart';
import 'package:flutter_application_1/widget/appbar.dart';
import 'package:flutter_application_1/widget/login_effect.dart';
import 'package:flutter_application_1/widget/login_input.dart';

class RegistrationPage extends StatefulWidget {
  final VoidCallback onJumpToLogin;
  RegistrationPage({Key? key, required this.onJumpToLogin}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;
  String? rePassword;
  String? phone;
  String? age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("注册", "登录", widget.onJumpToLogin),
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
            LoginInput(
              "确认密码",
              "请再次输入密码",
              lineStretch: true,
              obscureText: true,
              onChanged: (text) {
                rePassword = text;
                checkInput();
              },
              focusChanged: (foncus) {
                setState(() {
                  protect = foncus;
                });
              },
            ),
            LoginInput(
              "手机号",
              "请输入手机号",
              keyboardType: TextInputType.number,
              onChanged: (text) {
                phone = text;
                checkInput();
              },
            ),
            LoginInput(
              "年龄",
              "请输年龄",
              keyboardType: TextInputType.number,
              onChanged: (text) {
                age = text;
                checkInput();
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: _loginButton(),
            )
          ],
        ),
      ),
    );
  }

  void checkInput() {
    bool enable = false;
    if (isNotEmpty(userName ?? '') &&
        isNotEmpty(password ?? '') &&
        isNotEmpty(rePassword ?? '') &&
        isNotEmpty(phone ?? '') &&
        isNotEmpty(age ?? '')) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _loginButton() {
    return InkWell(
      child: Text("注册"),
      onTap: () {
        if (loginEnable) {
          checkParams();
        } else {
          print("补全信息");
        }
      },
    );
  }

  void send(name, pwd, phone, age) async {
    try {
      var result = await LoginDao.register(name, pwd, phone, age);

      if (result["success"]) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("成功"),
              content: Text("注册成功"),
            );
          },
        );

        if (widget.onJumpToLogin != null) {
          widget.onJumpToLogin();
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentTextStyle: TextStyle(
                color: Colors.red,
              ),
              // title: Text("失败"),
              content: Text(
                "注册失败，用户名重复",
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确定'),
                ),
              ],
            );
          },
        );
        print("注册失败---用户重复");
      }
    } on NeedAuth catch (e) {
    } on HiNetError catch (e) {}
  }

  void checkParams() {
    String tips;
    if (password != rePassword) {
      tips = "两次密码不一样";
      print(tips);
      return;
    } else if (phone?.length != 11) {
      tips = "请输入11位手机号";
      print(tips);
      return;
    }
    send(userName, password, phone, age);
  }
}
