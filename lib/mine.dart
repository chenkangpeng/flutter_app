import 'package:flutter/material.dart';

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MineWidgetState();
  }
}

class MineWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('会员中心'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text('会员中心'),
        ),
      ),
    );
  }
}
