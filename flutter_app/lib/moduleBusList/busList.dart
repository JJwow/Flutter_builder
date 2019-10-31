import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_app/tools/date_format_base.dart';
import 'package:flutter_app/moduleBusList/model/scheduleList.dart';
import 'package:flutter_app/moduleBusList/widget/busListCell.dart';
import 'package:flutter_app/moduleBusList/widget/busListSelectBarView.dart';
void main() => runApp(MyBusList());

class MyBusList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('苏州-上海',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(68, 138, 255, 1),
      ),
      backgroundColor: Colors.white,
      body: BusListBody(),
    );
  }
}

Future<List<ScheduleList>> getScheduleList() async {
  //读取json文件
  String jsonString = await rootBundle.loadString("assets/bus.json");
  //转成List或Map类型
  final jsonResult = json.decode(jsonString);
  //遍历List，并转成ScheduleList对象
  List<ScheduleList> scheduleList = new List();
  for (Map<String, dynamic> map in jsonResult){
    ScheduleList schudule = ScheduleList.withMap(map);
    changeDateFormat(schudule);
    scheduleList.add(schudule);
  }
  return scheduleList;
}

//改变时间格式
ScheduleList changeDateFormat(ScheduleList schedule){
  schedule.dptDateTime = formatDateString(schedule.dptDateTime, [HH,':',nn]);
  return schedule;
}

class BusListBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: MediaQuery.of(context).padding.bottom+55,
          child: BusList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: MediaQuery.of(context).padding.bottom,
          child: Container(
            color: Color.fromRGBO(46, 64, 85, 0.97),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).padding.bottom,
          height: 55,
          child: BusListSelectBarView(),
        )
      ],
    );
  }
}

class BusList extends StatefulWidget{
  @override
  _BusListState createState() => new _BusListState();
}

class _BusListState extends State<BusList>{
  List<ScheduleList> busList = [];
  @override
  void initState(){
    getScheduleList().then((busList){
      setState((){
        this.busList = busList;
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: busList.length,
      itemBuilder: (BuildContext content, int index){
        return BusListCell(busData: busList[index],);
      },
    );
  }
}

