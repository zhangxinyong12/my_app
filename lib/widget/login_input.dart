import "package:flutter/material.dart";
import 'package:flutter_application_1/util/color.dart';

// 登录输入

class LoginInput extends StatefulWidget {
  final String title;
  final String hinit;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType? keyboardType;
  LoginInput(this.title, this.hinit,
      {Key? key,
      this.onChanged,
      this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      print("has focus:$_focusNode.hasFocus");
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            _input(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: !widget.lineStretch ? 15 : 0,
          ),
          child: Divider(
            height: 1,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }

  _input() {
    return Expanded(
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        autofocus: !widget.obscureText,
        cursorColor: primary,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hinit,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
