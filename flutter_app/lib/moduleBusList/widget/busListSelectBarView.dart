import 'package:flutter/material.dart';
import 'package:flutter_app/config_enum.dart';
class BusListSelectBarView extends StatefulWidget{
  @override
  _BusListSelectBarViewState createState() => _BusListSelectBarViewState();
}
class _BusListSelectBarViewState extends State<BusListSelectBarView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SelectItem(),
        SelectItem(),
        SelectItem()
      ],
    );
  }
}

class SelectItem extends StatelessWidget{
  SelectItem({Key key, this.type, this.bSelected})
      :super(key: key);
  final BusListSelectBarType type;
  final bool bSelected;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 10,
              width: 20,
              height: 20,
              child: Image.asset('images/icon_cfcz_buslist_sel.png'),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 30,
              bottom: 0,
              child: Text('出发车站'),
            )
          ],
        )
      ],
    );
  }
}