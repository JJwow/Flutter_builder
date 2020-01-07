import 'package:flutter/material.dart';
import 'package:flutter_app/page/module_bus/moduleBusList/model/scheduleList.dart';
import 'package:flutter_app/utils/date_format_base.dart';
class BusListCell extends StatefulWidget{
  BusListCell({Key key, this.busData})
      :super(key: key);
  ScheduleList busData;
  @override
  _BusListCellState createState() => new _BusListCellState();
}

class _BusListCellState extends State<BusListCell>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ///flutter不允许更改传入widget的原始数据，更改了就被标为dirty，影响布局，但可以赋值到一个新的数据对象上
    String dateTime = formatDateString(widget.busData.dptDateTime, [HH,':',nn]);
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset('images/lable_buslist_tuijian.png',width: 30,height: 16,fit: BoxFit.fill)
        ),
        Positioned(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    padding: EdgeInsets.only(left: 15,right: 31),
                    child: Text(dateTime,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 135,
                    margin: EdgeInsets.only(top: 8,bottom: 8),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset('images/img_buslist_..png',width: 6,height: 6,fit: BoxFit.fill,),
                                  ),
//                          Container(
//                            child: Image.asset('images/img_buslist_line.png',width: 1,fit: BoxFit.scaleDown),
//                          ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8,bottom: 2),
                                  child: Text(widget.busData.departure, style: TextStyle(fontSize: 16,color: Color.fromRGBO(51, 51, 51, 1),fontWeight: FontWeight.bold),),
                                ),
                              ),

                              Container(
                                child: Text('¥'+'${widget.busData.ticketPrice}',style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
//                          Container(
//                            child: Image.asset('images/img_buslist_line.png',width: 1,fit: BoxFit.fitHeight),
//                          ),
                                  Container(
                                    child: Image.asset('images/img_buslist_kong.png',width: 6,height: 6,fit: BoxFit.fill,),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8,top: 2),
                                  child: Text(widget.busData.destination, style: TextStyle(fontSize: 16,color: Color.fromRGBO(51, 51, 51, 1),fontWeight: FontWeight.bold),),
                                ),
                              ),

                              Container(
                                child: Text("余票"+"${widget.busData.ticketLeft}",style: TextStyle(fontSize: 12,color: Color.fromRGBO(34, 34, 34, 1)),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      width: 120,
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              width: 90,
                              height: 17,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(width: 0.5,color: Color.fromRGBO(68, 138, 255, 1))
                              ),
                              child: Text('途经车/流水班>',style: TextStyle(fontSize: 12,color: Color.fromRGBO(68, 138, 255, 1)),),
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: MediaQuery.of(context).size.width - 135,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Offstage(
                              offstage: widget.busData.coachType.length == 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('images/icon_orderlist_bus.png',fit: BoxFit.fill,width: 11,height: 12,),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(widget.busData.coachType,style: TextStyle(fontSize: 12,color: Color.fromRGBO(153, 153, 153, 1)),),
                                  )
                                ],
                              ),
                            ),
                            Offstage(
                              offstage: widget.busData.runTime.length == 0,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(widget.busData.runTime,style: TextStyle(fontSize: 11,color: Color.fromRGBO(153, 153, 153, 1)),),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset('images/icon_info.png',fit: BoxFit.fill,width: 14.5,height: 14.5,),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Offstage(
                          offstage: widget.busData.remark.length == 0,
                          child: Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('images/icon_orderlist_note.png',fit: BoxFit.fill,width: 11,height: 12,),

                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(widget.busData.remark,style: TextStyle(fontSize: 11,color: Color.fromRGBO(102, 102, 102, 1)),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(237, 240, 245, 1),
              )
            ],
          ),
        ),
      ],

    );
  }
}