import 'package:dio/dio.dart';
import 'dart:convert';
//方法内需要使用多线程await时，方法定义上需要用Future、async
Future <String> getUser (String userName) async{
  //实例化Dio对象
  Dio dio = new Dio();
  //发动请求并获取返回
  Response response = await dio.post("http://localhost:9000/getUser",queryParameters: {"userName":userName});
  ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
  Map responseMap = json.decode(json.encode(response.data));
  if (responseMap["code"] == "200"){
    return "200";
  }
  else{
    return responseMap["message"];
  }
}

//方法内需要使用多线程await时，方法定义上需要用Future、async
Future <String> login (String userName,String password) async{
  //实例化Dio对象
  Dio dio = new Dio();
  //发动请求并获取返回
  Response response = await dio.post("http://localhost:9000/login",queryParameters: {"userName":userName,"password":password});
  ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
  Map responseMap = json.decode(json.encode(response.data));
  if (responseMap["code"] == "200"){
    return "200";
  }
  else{
    return responseMap["message"];
  }
}