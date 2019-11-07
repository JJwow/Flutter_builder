import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_app/tools/date_format_base.dart';
import 'package:flutter_app/moduleBusList/model/scheduleList.dart';
import 'package:flutter_app/moduleBusList/widget/busListCell.dart';
import 'package:flutter_app/moduleBusList/widget/busListSelectBarView.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app/moduleBusList/viewModel/busListViewModel.dart';
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



class BusListBody extends StatefulWidget{
  @override
  _BusListBodyState createState() => _BusListBodyState();
}

class _BusListBodyState extends State<BusListBody> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  bool isScrollingUp = false;
  double lastOffSetX = 0;
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,duration: Duration(milliseconds: 500)
    );
    animation = Tween(begin:0,end:100).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }
  void bottomViewAnimation(val){
    setState(() {
      //上滑
//      if (val > lastOffSetX){
//        isScrollingUp = true;
//      }
//      Future<void>.delayed(Duration(seconds: 1),(){
//        if (isScrollingUp == false){
//          animationController.forward();
//        }
//      });
//      isScrollingUp = false;
//      lastOffSetX = val;
    });
  }
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
          child: BusList(scrollCallBlock: bottomViewAnimation,),
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
          bottom: -55 + animationController.value * 89 ,
          height: 55,
          child: BusListSelectBarView(),
        )
      ],
    );
  }
}

class BusList extends StatefulWidget{
  BusList({Key key,this.scrollCallBlock}):super(key:key);
  final scrollCallBlock;
  @override
  _BusListState createState() => new _BusListState();
}

class _BusListState extends State<BusList>{
  List<ScheduleList> busList = [];
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  @override
  void initState(){
    super.initState();
    getBusListData().then((busList){
      setState((){
        this.busList = busList;
      });
    });

    _controller.addListener((){
      print(_controller.offset);
      widget.scrollCallBlock(_controller.offset);
    });
  }
  void dispose(){
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  //下拉更新数据
  Future<void> _handleRefresh() async {
    await Future<void>.delayed(Duration(seconds: 3),(){
      print('刷新');
      setState(() {

      });
    });
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    return RefreshIndicator(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemCount: busList.length,
        itemBuilder: (BuildContext content, int index){
          ScheduleList schedule = busList[index];
          return BusListCell(busData: busList[index],);
        },
        physics: const AlwaysScrollableScrollPhysics(),
      ),
      onRefresh: _handleRefresh,
    );
  }
}

