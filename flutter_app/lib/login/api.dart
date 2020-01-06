import 'package:flutter_app/model/queryLoginModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'dart:io';
import 'dart:convert';
class Api {
  factory Api() {
    return _get();
  }

  static Api _instance;

  Api._internal() {
    //init Api instance
  }

  static _get() {
    if (_instance == null) {
      _instance = Api._internal();
    }
    return _instance;
  }


  Future <QueryLoginModel> getUser (String userName) async{
    String url;
    if(Platform.isIOS){
      //ios相关代码
      url = iosUrl+"getUser";
    }else if(Platform.isAndroid){
      //android相关代码
      url = androidUrl+"getUser";
    }
    Dio dio = new Dio();
    Response response = await dio.post(url,queryParameters: {
      "userName": userName,
    });
    ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
    Map responseMap = json.decode(json.encode(response.data));
    var queryLoginModel = new QueryLoginModel.fromJson(responseMap);
    return queryLoginModel;
  }
}