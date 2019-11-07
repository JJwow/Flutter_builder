import 'config_enum.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
launchURL(LoginType type ,BuildContext context) async {
  String urls;
  switch (type){
    case LoginType.wechat:{
      urls = 'weixin://';
    }
    break;
    case LoginType.qq:{
      urls = 'mqq://';
    }
    break;
    case LoginType.alipay:{
      urls = 'alipay://';
    }
    break;
  }
  if (await canLaunch(urls)) { // 判断当前手机是否安装某app. 能否正常跳转
    await launch(urls);
  } else {
    String message;
    switch (type){
      case LoginType.wechat:{
        message = '未安装微信';
      }
      break;
      case LoginType.qq:{
        message = '未安装QQ';
      }
      break;
      case LoginType.alipay:{
        message = '未安装支付宝';
      }
      break;
    }
    showAlertDialog(message,context);
//        throw 'Could not launch $urls';
  }
}
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
