import 'package:dio/dio.dart';
import 'dart:io';
import '../configs/service_url.dart';
import 'dart:async';

getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    // 表单形式
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后台接口出现异常');
    }
  } catch (e) {
    return print('Error:${e}');
  }
}
