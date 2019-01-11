import 'package:flutter/material.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_app/product.dart';
import 'package:flutter_app/mine.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '中储智运',
      home: new MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainWidgetState();
  }
}

class MainWidgetState extends State<MainWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new HomeWidget(),
            new ProductWidget(),
            new ProductWidget(),
            new MineWidget(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: tabController,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "首頁",
                icon: new Icon(Icons.brightness_5),
              ),
              new Tab(
                text: "產品列表",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "產品列表",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "會員中心",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
