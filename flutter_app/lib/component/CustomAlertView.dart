import 'package:flutter/material.dart';
showAlertDialog(String message ,BuildContext context){
  showDialog(
      context: context,
      builder:(ctx){
        return AlertDialog(
          title: Text('提示'),
          content: Text('$message'),
          actions: <Widget>[
            new FlatButton(
              child: Text('确定'),
              onPressed: (){
                Navigator.of(context).maybePop();
              },
            )
          ],
        );
      }
  );
}