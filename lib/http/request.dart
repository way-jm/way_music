import 'dart:async';
import 'package:dio/dio.dart';

class HttpRequest{
  static Dio dio = new Dio(new Options(
      baseUrl:"",
      connectTimeout:5000,
      receiveTimeout:3000
  ));

  // 登录接口，登录成功后返回用户信息
  Future getTopSongs() async {
    String url = "https://c.y.qq.com/v8/fcg-bin/fcg_myqq_toplist.fcg?inCharset=utf-8&outCharset=utf-8&format=json";
    return await dio.get(url);
  }

}