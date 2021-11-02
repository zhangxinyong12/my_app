import 'package:flutter/material.dart';

/// 登录动效  切换图标

class LoginEffect extends StatefulWidget {
  final bool protect;
  LoginEffect({Key? key, required this.protect}) : super(key: key);

  @override
  _LoginEffectState createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(
          bottom: BorderSide(
            color: Color(0xff34344),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(widget.protect),
          Image(
            image: AssetImage("images/header_logo.png"),
            height: 90,
          ),
          _image(widget.protect),
        ],
      ),
    );
  }

  _image(bool left) {
    print("bool left:$left");
    var headerLeft = left ? 'images/header_left.png' : 'images/header_left.png';
    var headerRight =
        left ? 'images/header_right.png' : 'images/header_right.png';
    return Image(
      width: 90,
      height: 90,
      image: AssetImage(left ? headerLeft : headerRight),
    );
  }
}
