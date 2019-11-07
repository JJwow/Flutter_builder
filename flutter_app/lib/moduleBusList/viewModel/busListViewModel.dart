import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_app/moduleBusList/model/scheduleList.dart';
import 'dart:convert';
Future <List<ScheduleList>> getBusListData () async{
  Dio dio = new Dio();
  Response response = await dio.get('http://localhost:9000/queryData');
  print(response.data);
  Map responseMap = json.decode(json.encode(response.data));
  var scheduleListModel = new ScheduleListResponse.fromJson(responseMap);
  return scheduleListModel.scheduleList;
}