import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../configs/httpHeaders.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  String showText = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: _httpAction,
                  child: Text('请求数据'),
                ),
                Text(showText)
              ],
            ),
          )),
    );
  }

  _httpAction() {
    getHttp().then((val) {
      print('请求数据-------------------');
//      setState((){
//        showText = val['data']['name'];
//      });
      print(val);
    });
  }

  getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response =
          await dio.post('https://time.geekbang.org/serv/v1/column/topList');
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
