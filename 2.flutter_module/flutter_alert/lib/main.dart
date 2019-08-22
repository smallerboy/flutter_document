import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() => runApp(MyApp());
void main() => runApp(_widgetForRouter(ui.window.defaultRouteName));

//根据iOS端传过来的router跳转不同的页面
Widget _widgetForRouter(String route) {
  switch(route) {
    case 'myApp':
    return new MyApp();
    case 'home':
    return new HomePageWidget(title: 'test456',);
    default:
    return Center(
      child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bridge Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(title: 'test123',),
    );
  }
}

class HomePageWidget extends StatefulWidget {

  HomePageWidget({Key key, this.title}) :super(key: key);
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageWidget> {

  //创建一个给native的chanel
  //static const methodChannel = const MethodChannel('com.pages.your/native_get');

  @override
  Widget build(BuildContext context) {

    //调用弹出框
    void _showCustomAlert() async {
      //发送消息给native
      //Map<String, String> map = {"title": "用户点击了中心按钮"};
      //methodChannel.invokeMapMethod('toNativePush',map);

      return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('警告弹出框'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('line1'),
              Text('line2'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('知道了!'),
            onPressed: () {
              Navigator.of(context).pop();
              //Map<String, String> map = {"title": "弹出框确认点击"};
              //methodChannel.invokeMapMethod('dismissAlert',map);
            },
          ),
        ],
      );
    },
  );
}

    return Scaffold(
      body: Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // const RaisedButton(
        //   onPressed: null,
        //   child: Text(
        //     '调用弹出框',
        //     style: TextStyle(fontSize: 20)
        //   ),
        // ),
        const SizedBox(height: 30),
        RaisedButton(
          onPressed: _showCustomAlert,
          child: const Text(
            'Enabled Button1',
            style: TextStyle(fontSize: 20)
          ),
        ),
        const SizedBox(height: 30),
        // RaisedButton(
        //   onPressed: () {},
        //   textColor: Colors.white,
        //   padding: const EdgeInsets.all(0.0),
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: <Color>[
        //           Color(0xFF0D47A1),
        //           Color(0xFF1976D2),
        //           Color(0xFF42A5F5),
        //         ],
        //       ),
        //     ),
        //     padding: const EdgeInsets.all(10.0),
        //     child: const Text(
        //       'Gradient Button2',
        //       style: TextStyle(fontSize: 20)
        //     ),
        //   ),
        // ),
      ],
    ),    
  ),
);
  



  }
}

