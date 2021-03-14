import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_retrofit_getx/widgat/posts_widgat.dart';

import 'dependaency_injection/locator.dart';
import 'getx/binig.dart';

void main() {
  setup();
  runApp(GetMaterialApp(home: MyApp(),
    initialBinding: Bindingg(),));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Posts',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Myposts() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
