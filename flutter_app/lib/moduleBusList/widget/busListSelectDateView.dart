import 'package:flutter/material.dart';
class BusListSelectDateView extends StatefulWidget{
  @override
  _BusListSelectDateViewState createState() => _BusListSelectDateViewState();
}
class _BusListSelectDateViewState extends State<BusListSelectDateView>{
  @override
  ///build下面的每次改变状态都会走，widget内全局变量需要写在build上面
  int selectedIndex = 1;
  Widget build(BuildContext context) {
    // TODO: implement build
    void selectedCallBack(int index){
      setState(() {
        selectedIndex = index;
      });
    }
    return Row(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(42, 130, 229, 1),
          width: MediaQuery.of(context).size.width-50,
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext content, int index){
                return SelectDateWidget(selectedCallBack:selectedCallBack,bSelected:(selectedIndex==index?true:false),index: index,);
              }
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: Container(
            width: 50,
            height: 60,
            color: Color.fromRGBO(42, 130, 229, 1),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 12,
                  top: 7,
                  child: Text('全部\n日期',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                Positioned(
                  left: 20,
                  bottom: 8,
                  child: Image.asset('images/arrow_list_riqi.png',width: 10,height: 5,),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SelectDateWidget extends StatefulWidget{
  SelectDateWidget({Key key,this.selectedCallBack,this.bSelected,this.index}):super(key:key);
  final selectedCallBack;
  final bool bSelected;
  final int index;
  _SelectDateWidget createState() => _SelectDateWidget();
}
class _SelectDateWidget extends State<SelectDateWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color backColor = widget.bSelected?Colors.white:Color.fromRGBO(42, 130, 229, 1);
    Color textColor = widget.bSelected?Color.fromRGBO(68, 138, 255, 1):Colors.white;
    return InkWell(
      onTap: (){
        widget.selectedCallBack(widget.index);
      },
      child: Padding(
          padding: EdgeInsets.only(left: 5,top: 5,bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
                width: (MediaQuery.of(context).size.width-50)/6 -5,
                height: 50,
                color: backColor,
                alignment: Alignment.center,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: '11-20\n',
                        style: TextStyle(color: textColor,fontSize: 11),
                        children: [
                          TextSpan(
                            text: '今天',
                            style: TextStyle(color: textColor,fontSize: 11),
                          ),
                        ]
                    )
                )
            ),
          )

      ),
    );
  }
}

