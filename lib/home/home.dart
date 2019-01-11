import 'package:flutter/material.dart';
import 'package:flutter_app/home/banner.dart';
import 'package:flutter_app/bean/BannerItem.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
          backgroundColor: Color.fromARGB(255, 119, 136, 213),
          centerTitle: true,
        ),
        body: new Center(
          child: new BannerWidget(this.getImgItems()),
        ),
      ),
    );
  }

  getImgItems() {
    List<BannerItem> items = [];
    items.add(new BannerItem(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547198393218&di=9052beb53220f9848dc9583b67208f5e&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F17%2F70%2F30%2F557ac706a8f0c_1024.jpg'));
    items.add(new BannerItem(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547198471839&di=0a7bfb45ab43b65ae8d84e47b4288088&imgtype=0&src=http%3A%2F%2Fpic93.nipic.com%2Ffile%2F20160401%2F11735013_094056238000_2.jpg'));
    items.add(new BannerItem('http://via.placeholder.com/350x150',id: '11000'));
    return items;
  }
}
