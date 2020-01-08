import 'package:dio/dio.dart';
import 'package:flutter_app/apiModel/apiModel_bus/scheduleList.dart';
import 'dart:convert';
import 'package:flutter_app/utils/httpUtil_methods.dart';
import 'package:flutter_app/config/config.dart';
import 'dart:io';
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
  //方法内需要使用多线程await时，方法定义上需要用Future、async
  Future <List<ScheduleList>> getBusListData () async{
//  //实例化Dio对象
//  Dio dio = new Dio();
//  //发动请求并获取返回
//  Response response = await dio.get('http://localhost:9000/queryScheduleData');
//  ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
//  Map responseMap = json.decode(json.encode(response.data));
    String url;
    if(Platform.isIOS){
      //ios相关代码
      url = iosUrl+"queryScheduleData";
    }else if(Platform.isAndroid){
      //android相关代码
      url = androidUrl+"queryScheduleData";
    }
    var jsonString = await httpUtil.get(url,);
    ///因为dio返回的时候会默认将字符串json化，json化后键值对会没有双引号，但json.decode方法传入的string需要是json化之前的原始数据，所以要先将response.data反序列化
    Map responseMap = json.decode(jsonString);
    ///将Map映射到事先准备好的model里
    var scheduleListModel = new ScheduleListResponse.fromJson(responseMap);
    return scheduleListModel.scheduleList;
  }
}
