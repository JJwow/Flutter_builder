import 'package:flutter/material.dart';
import 'package:flutter_app/config/config_enum.dart';
class BusListSelectBarView extends StatefulWidget{
  @override
  _BusListSelectBarViewState createState() => _BusListSelectBarViewState();
}
class _BusListSelectBarViewState extends State<BusListSelectBarView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromRGBO(46, 64, 85, 0.97),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectItem(type: BusListSelectBarType.BusListSelectBarType_depart,bSelected: false,),
          SelectItem(type: BusListSelectBarType.BusListSelectBarType_destination,bSelected: false,),
          SelectItem(type: BusListSelectBarType.BusListSelectBarType_time,bSelected: false,),
        ],
      ),
    );
  }
}

class SelectItem extends StatelessWidget{
  SelectItem({Key key, this.type, this.bSelected})
      :super(key: key);
  final BusListSelectBarType type;
  final bool bSelected;
  String sImg;
  String sTitle;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final num fHeight = MediaQuery.of(context).size.width / 3;
    switch (type){
      case BusListSelectBarType.BusListSelectBarType_depart:{
        if (bSelected){
          sImg = 'images/icon_cfcz_buslist_sel.png';
        }
        else{
          sImg = 'images/icon_cfcz_buslist.png';
        }
        sTitle = '出发车站';
      }
      break;
      case BusListSelectBarType.BusListSelectBarType_destination:{
        if (bSelected){
          sImg = 'images/icon_ddcz_buslist_sel.png';
        }
        else{
          sImg = 'images/icon_ddcz_buslist.png';
        }
        sTitle = '出发车站';
      }
      break;
      case BusListSelectBarType.BusListSelectBarType_time:{
        if (bSelected){
          sImg = 'images/icon_time_buslist_sel.png';
        }
        else{
          sImg = 'images/icon_time_buslist_rest.png';
        }
        sTitle = '出发车站';
      }
      break;
    }
    return Container(
      width: fHeight,
      height: 55,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: fHeight / 2 - 10,
            child: Image.asset(sImg,width: 20,height: 20,),
          ),
          Positioned(
            top: 38,
            left: 0,
            right: 0,
            bottom: 0,
            child: Text(sTitle,textAlign:TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Color.fromRGBO(161, 192, 222, 1)),),
          )
        ],
      ),
    );
  }
}
//Column(
//children: <Widget>[
//Image.asset('images/icon_cfcz_buslist.png',width: 10,height: 10,),
//Text('出发车站')
//],
//)