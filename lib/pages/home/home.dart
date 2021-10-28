import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NewsList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class NewsList extends StatefulWidget {
  NewsList({Key? key}) : super(key: key);
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Dio _dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    print("生命周期 initState");
    // 发送请求获取数据
    const url = "http://192.168.48.103:3000/"; // 不能写localhost，会报错
    var data = await _dio.get(url);
    print("获取请求回来的结果data:");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      // itemExtent: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            "第${index + 1}列表",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (index % 10 == 0 && index > 9) {
          return Divider(
            color: Colors.red,
          );
        }
        return SizedBox(
          width: 0,
          height: 0,
        );
      },
    );
  }
}
