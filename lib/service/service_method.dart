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

Future getHomePageBeloContent(formData) async {
  try {
    print('开始获取下拉数据...');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    if (formData == null) {
      response = await dio.post(servicePath['homePageBelowConten']);
    } else {
      response =
          await dio.post(servicePath['homePageBelowConten'], data: formData);
    }
    return response;
//    if (response.statusCode == 200) {
//      return response.data;
//    } else {
//      throw Exception('后端接口出现异常');
//    }
  } catch (e) {
    return print('ERROR:====>${e}');
  }
}

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    return response;
//    if (response.statusCode == 200) {
//      return response.data;
//    } else {
//      return response.data;
////      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
//    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
