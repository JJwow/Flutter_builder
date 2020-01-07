import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/module_login/login_password/action.dart';
import 'state.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_app/page/module_bus/moduleBusList/busList.dart';
import 'package:flutter_app/component/CustomAlertView.dart';
Dispatch _dispatch;
Login_passwordState _state;
Widget buildView(Login_passwordState state, Dispatch dispatch, ViewService viewService) {
  _dispatch = dispatch;
  _state = state;
  return MyAppp();
}
bool bShowCleanTF = false;//控制是否需要清除
String name;
String password;
class MyAppp extends StatefulWidget {
  MyAppp({Key key, this.userName})
      :super(key: key);
  final String userName;
  _MyApppState createState() => new _MyApppState();
}
class _MyApppState extends State<MyAppp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    name = widget.userName;
    return Scaffold(
      resizeToAvoidBottomPadding:false,//弹出键盘就不会影响stack布局
      backgroundColor: Colors.white,
      body: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  _MyHomeBodyState createState() => new _MyHomeBodyState();
}
class _MyHomeBodyState extends State<MyHomeBody> {
  bool active = false;//控制登录按钮是否可点击
  bool bSecret = true;//控制密码是否密文显示
  TextFieldBody t = new TextFieldBody();
  void onDataChange(val) {
    setState(() {
      active = val;
    });
  }
  void secretAction(){
    setState(() {
      bSecret = !bSecret;
    });
  }
  void cleanAction(){
    setState(() {
      bShowCleanTF = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        BackButton(),
        TitleBody(),
        TextFieldBody(callback: onDataChange,bSecret:bSecret),
        BtnClean(callback:cleanAction),
        BtnSecret(callback:secretAction,bSecret: bSecret,),
        TextFieldLine(),
        LoginButton(active: active,),
        ForgetPasswordButton(),
        PhoneButton()
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
            Navigator.of(context).maybePop();
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
        '请输入登录密码',
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
  TextFieldBody({Key key, this.callback, this.bSecret})
      :super(key: key);
  final callback;
  final bool bSecret;
  @override
  _TextFieldBodyState createState() => _TextFieldBodyState();
}
class _TextFieldBodyState extends State<TextFieldBody>{
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      top: MediaQuery.of(context).size.height/2 - 135,
      right: 87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CBDTextField(callback: widget.callback,bSecret: widget.bSecret,),
        ],
      ),
    );
  }
}

//自定义输入框
class CBDTextField extends StatefulWidget{
  CBDTextField({Key key, this.callback, this.bSecret})
      :super(key: key);
  final callback;
  final bool bSecret;

  @override

  _CBDTextFieldState createState() => _CBDTextFieldState();
}
class _CBDTextFieldState extends State<CBDTextField>{

  @override
  final textEditingController = TextEditingController();
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      print("textEditingController:${textEditingController.text}");
      password = textEditingController.text;
    });
  }
  Widget build(BuildContext context) {
    //清空TF
    if (bShowCleanTF){
      textEditingController.clear();
      bShowCleanTF = false;
    }
    return TextField(
      controller: textEditingController,
      obscureText:widget.bSecret,
      decoration: InputDecoration(
          hintText: '6-18位字母或数字密码',
          labelText: textEditingController.text.length > 0 ? '手机号' : null,//不能用''，不然会影响到提示文案
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
        if (value.length >= 6){
          widget.callback(true);
        }
        else{
          widget.callback(false);
        }
        print("onChanged:$value");
      },
      onSubmitted: (value) {
        print("onSubmitted:$value");
      },
    );
  }
}

class BtnSecret extends StatelessWidget{
  BtnSecret({Key key, this.callback, this.bSecret})
      :super(key: key);
  final callback;
  final bool bSecret;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: MediaQuery.of(context).size.height/2 - 135 + 18,
      right: 10,
      width: 36,
      height: 18,
      child: FloatingActionButton(
        child: Image.asset(bSecret ? 'images/icon_sign_eye_close.png' : 'images/icon_sign_eye.png'),
        heroTag: 004,
        elevation: 0,
        highlightElevation:0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        onPressed: (){
          callback();
        },
      ),
    );
  }
}

class BtnClean extends StatelessWidget{
  BtnClean({Key key, this.callback,})
      :super(key: key);
  final callback;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: MediaQuery.of(context).size.height/2 - 135 + 20,
      right: 50,
      width: 12,
      height: 12,
      child: FloatingActionButton(
        child: Image.asset('images/icon_sign_delete.png'),
        heroTag: 005,
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        onPressed: (){
          callback();
        },
      ),
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
        child: Text('登录', style: TextStyle(color: Colors.white, fontSize: 18)),
        color: Color.fromRGBO(68, 138, 255, active ? 1 : 0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
        onPressed: (){
          if (active){
            _state.userName = name;
            _state.password = password;
            _dispatch(Login_passwordActionCreator.onLogin());
          }
        },
      ),
    );
  }
}

void pushTo(String message,BuildContext context){
  if (message == "200"){
    prefix0.Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content)=>MyBusList()));
  }
  else{
    showAlertDialog(message,context);
  }
}

//忘记密码
class ForgetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height/2 + 50,
      left: 25,
      child: RaisedButton(
        child: Text('忘记密码',style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1),fontSize: 16)),
        color: Colors.white,
        elevation: 0,
        onPressed: (){
          print('忘记密码');
        },
      ),
    );
  }
}

//手机验证码登录
class PhoneButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height/2 + 50,
      right: 25,
      child: RaisedButton(
        child: Text('手机验证码登录',style: TextStyle(color: Color.fromRGBO(68, 138, 255, 1),fontSize: 16)),
        color: Colors.white,
        elevation: 0,
        onPressed: (){
          print('手机验证码登录');
        },
      ),
    );
  }
}