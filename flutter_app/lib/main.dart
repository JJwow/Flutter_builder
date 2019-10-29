import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/password.dart';
import 'Hybird.dart';
import 'config_urls.dart';
import 'config_enum.dart';
import 'party_software_methods.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        resizeToAvoidBottomPadding:false,//弹出键盘就不会影响stack布局
        backgroundColor: Colors.white,
        body: MyHomeBody(),
      ),
        routes: <String, WidgetBuilder> {
          '/screen1': (BuildContext context) => new MyAppp(),
        },
    );
  }
}

class MyHomeBody extends StatefulWidget {
  _MyHomeBodyState createState() => new _MyHomeBodyState();
}
class _MyHomeBodyState extends State<MyHomeBody> {
  bool active = false;
  void onDataChange(val) {
    setState(() {
      active = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        BackButton(),
        TitleBody(),
        TextFieldBody(callback:(val) => onDataChange(val),),
        TextFieldLine(),
        LoginButton(active: active,),
        AgreementTextPosition(),
        OtherLoginTitleLine(),
        OtherLoginTitle(),
        OtherLogin()
      ],
    );
  }
}

//返回按钮
class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      top: MediaQuery.of(context).padding.top + 20,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 25,
        onPressed: (){
          print('fanhui');
        },
      )
    );
  }
}


//标题UI
class TitleBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      top: MediaQuery.of(context).padding.top/2 + (MediaQuery.of(context).size.height/2 - 135)/2,
      child: Text(
        '登录巴士管家',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
      ),
    );
  }
}

//输入UI
class TextFieldBody extends StatefulWidget {
  TextFieldBody({Key key, this.callback})
      :super(key: key);
  final callback;
  @override
  _TextFieldBodyState createState() => _TextFieldBodyState();
}
class _TextFieldBodyState extends State<TextFieldBody>{
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      top: MediaQuery.of(context).size.height/2 - 135,
      right: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CBDTextField(callback: widget.callback,),
        ],
      ),
    );
  }
}

//自定义输入框
class CBDTextField extends StatefulWidget{
  CBDTextField({Key key, this.callback})
      :super(key: key);
  final callback;
  @override
  _CBDTextFieldState createState() => _CBDTextFieldState();
}
class _CBDTextFieldState extends State<CBDTextField>{
  final textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      print("textEditingController:${textEditingController.text}");
    });
  }
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: '请输入您的手机号登录或注册',
//        labelText: '手机号',
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(204, 204, 204, 1),
        )
      ),
      style: TextStyle(
        fontSize: 18,
        color: Color.fromRGBO(51, 51, 51, 1),
      ),

      onChanged: (value) {
        RegExp exp = RegExp(
            r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
        bool matched = exp.hasMatch(value);
        if (matched){
          widget.callback(true);
        }
        else{
          widget.callback(false);
        }
      },
      onSubmitted: (value) {
        print("onSubmitted:$value");
      },
    );
  }
}

//输入框下方的线
class TextFieldLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 25,
        top: MediaQuery.of(context).size.height/2 - 80,
        right: 25,
        height: 1,
        child: Image.asset(
          'images/line_all.jpeg',
          fit: BoxFit.fill,
        ),
    );
  }
}

//按钮样式
class LoginButton extends StatelessWidget {
  LoginButton({Key key, this.active})
      :super(key: key);
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height/2 - 50,
      left: 25,
      right: 25,
      height: 50,
      child: RaisedButton(
        child: Text('下一步', style: TextStyle(color: Colors.white, fontSize: 18)),
        color: Color.fromRGBO(68, 138, 255, active ? 1 : 0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
        onPressed: (){
          if (active) {
            Navigator.of(context).pushNamed('/screen1');
          }
        },
      ),
    );
  }
}

class AgreementTextPosition extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top:  MediaQuery.of(context).size.height/2 + 46,
      left: 25,
      right: 25,
      child: AgreementText(),
    );
  }
}

//协议说明富文本
class AgreementText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TapGestureRecognizer selfRecognizer = TapGestureRecognizer();
    selfRecognizer.onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content)=>Browser(url: SelfAgreementUrl,title: '巴士管家隐私协议',)));
    };
    final TapGestureRecognizer memberRecognizer = TapGestureRecognizer();
    memberRecognizer.onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content)=>Browser(url: MemberAgreementUrl,title: '巴士管家服务协议',)));
    };
    final TapGestureRecognizer trainRecognizer = TapGestureRecognizer();
    trainRecognizer.onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content)=>Browser(url: TrainAgreementUrl,title: '巴士管家火车票服务协议',)));
    };
    final TapGestureRecognizer hailingRecognizer = TapGestureRecognizer();
    hailingRecognizer.onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content)=>Browser(url: HailingAgreementUrl,title: '巴士管家网约车协议',)));
    };
    return RichText (
      text: TextSpan(
        text: '登录即表示同意',
        style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1),fontSize: 13),
        children: [
          TextSpan(
            text: '《巴士管家隐私协议》',
            style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1)),
            recognizer:selfRecognizer
          ),
          TextSpan(
              text: '《巴士管家服务协议》',
              style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1)),
              recognizer:memberRecognizer
          ),
          TextSpan(
              text: '《巴士管家火车票服务协议》',
              style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1)),
              recognizer:trainRecognizer
          ),
          TextSpan(
              text: '《巴士管家网约车协议》',
              style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1)),
              recognizer:hailingRecognizer
          ),
        ]
      )
    );
  }
}

//第三方登录标题
class OtherLoginTitleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      bottom: MediaQuery.of(context).padding.bottom + 110,
      right: 25,
      height: 1,
      child: Image.asset(
        'images/line_all.jpeg',
        fit: BoxFit.fill,
      ),
    );
  }
}
class OtherLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 100,
      child: Text('第三方登录',style: TextStyle(color: Color.fromRGBO(170, 170, 170, 1),backgroundColor: Colors.white),),
    );
  }
}

//第三方登录
class OtherLogin extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 40,
      left: 0,
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            child: Image.asset('images/icon_Sign_weixin.png'),
            heroTag: 001,
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: (){
              launchURL(LoginType.wechat,context);
            },
          ),
          FloatingActionButton(
            child: Image.asset('images/icon_Sign_qq.png'),
            heroTag: 002,
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: (){
              launchURL(LoginType.qq,context);
            },
          ),
          FloatingActionButton(
            child: Image.asset('images/icon_Sign_pay.png'),
            heroTag: 003,
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: (){
              launchURL(LoginType.alipay,context);
            },
          ),
        ],
      ),
    );
  }
}