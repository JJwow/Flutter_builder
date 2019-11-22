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
import 'package:flutter_app/config_enum.dart';
import 'package:flutter_app/moduleBusList/widget/busListSelectDateView.dart';
void main() => runApp(MyBusList());
double historyY = 0.0;
double headerTop = 0.0;
bool bOperation = false;
class MyBusList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('苏州-上海',style: TextStyle(color: Colors.white,fontSize: 18),),
        backgroundColor: Color.fromRGBO(68, 138, 255, 1),
        elevation: 0.0,
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

class _BusListBodyState extends State<BusListBody> with TickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  ScrollType scrollType = ScrollType.ScrollType_aimation;
  double operationScrollOffset = 0.0;
  double animationScrollOffset = 0.0;
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,duration: Duration(milliseconds: 500)
    );
    animation = Tween(begin:0.0,end:1.0).animate(animationController);
    animation.addListener(() {
      setState(() {
        double height = (MediaQuery.of(context).padding.bottom+55);
        animationScrollOffset = animation.value * height;
        operationScrollOffset = height;
      });
    });
    animationController.forward();
  }
  void bottomViewAnimation(val){
    double height = (MediaQuery.of(context).padding.bottom+55);
    double offsetY = val;
    double diffY = offsetY - historyY;
    if (scrollType == ScrollType.ScrollType_operation){
      setState(() {
        ///下滑
        if (diffY > 0){
          if(operationScrollOffset - diffY >= 0){
            operationScrollOffset = operationScrollOffset - diffY;
          }
          else{
            operationScrollOffset = 0;
          }
        }
        ///上滑
        else{
          if(operationScrollOffset - diffY <= height){
            operationScrollOffset = operationScrollOffset - diffY;
          }
          else{
            operationScrollOffset = height;
          }
        }
        animationScrollOffset = operationScrollOffset;
      });
    }
    historyY = offsetY;
  }
  void actionOnPointerUp(PointerUpEvent event){
    scrollType = ScrollType.ScrollType_aimation;
    double height = (MediaQuery.of(context).padding.bottom+55);
    double begins = (animationScrollOffset.toInt())/(height.toInt());
    animation = Tween(begin:begins.toDouble(),end:1.0).animate(animationController);
    Future<void>.delayed(Duration(milliseconds: 500),(){
      animationController.reset();
      animationController.forward();
    });
  }
  void actionOnPointerDown(PointerDownEvent event){
    scrollType = ScrollType.ScrollType_operation;
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
          height: 60,
          child: BusListSelectDateView(),
        ),
        Positioned(
          left: 0,
          top: 60,
          right: 0,
          bottom: MediaQuery.of(context).padding.bottom+55,
          child: BusList(scrollCallBlock: bottomViewAnimation,onPointerUpBlock: actionOnPointerUp,onPointerDownBlock: actionOnPointerDown,),
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
          bottom: -55 + (scrollType==ScrollType.ScrollType_aimation?animationScrollOffset:operationScrollOffset) ,
          height: 55,
          child: BusListSelectBarView(),
        )
      ],
    );
  }
}

class BusList extends StatefulWidget{
  BusList({Key key,this.scrollCallBlock,this.onPointerUpBlock,this.onPointerDownBlock}):super(key:key);
  final scrollCallBlock;
  final onPointerUpBlock;
  final onPointerDownBlock;
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
  void actionOnPointerUp(PointerUpEvent event){
    widget.onPointerUpBlock(event);
  }
  void actionOnPointerDown(PointerDownEvent event){
    widget.onPointerDownBlock(event);
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    return Listener(
      onPointerUp: actionOnPointerUp,
      onPointerDown: actionOnPointerDown,
      child: RefreshIndicator(
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
      ),
    );
  }
}

