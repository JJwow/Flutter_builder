import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/tools/httpUtil_methods.dart';
import 'package:flutter_app/config.dart';
import 'dart:io';
//方法内需要使用多线程await时，方法定义上需要用Future、async
Future <String> getUser (String userName) async{
//  //实例化Dio对象
//  Dio dio = new Dio();
//  //发动请求并获取返回
//  Response response;
//  try{
//    FormData formData = new FormData.from({
//      "userName": userName,
//    });
//    response = await dio.post("http://localhost:9000/getUser",queryParameters: {
//      "userName": userName,
//    });
//  } on DioError catch(e) {
//    if(null != e.response) {
//      print(e.response.data);
//      print(e.response.headers);
//      print(e.response.request);
//    } else{
//      // Something happened in setting up or sending the request that triggered an Error
//      print(e.request);
//      print(e.message);
//    }
//  }

  String url;
  if(Platform.isIOS){
    //ios相关代码
    url = iosUrl+"getUser";
  }else if(Platform.isAndroid){
    //android相关代码
    url = androidUrl+"getUser";
  }
  FormData formData = new FormData.from({
    "userName": userName,
  });
  var jsonString = await httpUtil.post(url,data: formData);
  ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
  Map responseMap = json.decode(jsonString);
  if (responseMap["code"] == "200"){
    return "200";
  }
  else{
    return responseMap["message"];
  }
}

//方法内需要使用多线程await时，方法定义上需要用Future、async
Future <String> login (String userName,String password) async{
//  //实例化Dio对象
//  Dio dio = new Dio();
//  //发动请求并获取返回
//  Response response = await dio.post("http://10.0.2.2:9000/login",queryParameters: {"userName":userName,"password":password});
//  ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
//  Map responseMap = json.decode(json.encode(response.data));
  String url;
  if(Platform.isIOS){
    //ios相关代码
    url = iosUrl+"login";
  }else if(Platform.isAndroid){
    //android相关代码
    url = androidUrl+"login";
  }
  FormData formData = new FormData.from({
    "userName": userName,
    "password": password
  });
  var jsonString = await httpUtil.post(url,data: formData);
  Map responseMap = json.decode(jsonString);
  if (responseMap["code"] == "200"){
    return "200";
  }
  else{
    return responseMap["message"];
  }
}