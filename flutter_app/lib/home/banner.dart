import 'package:flutter/material.dart';
import 'package:flutter_app/comm/BaseWidget.dart';
import 'package:flutter_app/comm/BaseWidgetState.dart';
import 'package:flutter_app/bean/BannerItem.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends BaseWidget {
  final List<BannerItem> bannerItems;

  BannerWidget(this.bannerItems);

  @override
  State<StatefulWidget> createState() {
    return new BannerWidgetState();
  }
}

class BannerWidgetState extends BaseWidgetState<BannerWidget> {
  List<BannerItem> items;

  @override
  Widget build(BuildContext context) {
    BannerWidget widget = this.widget;
    items = widget.bannerItems;
    return new Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Swiper(
          itemCount: items.length,
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

//构建图片
  Widget _buildItem(BuildContext context, int index) {
    BannerItem item = items[index];
    return (Image.network(
      item.url,
      fit: BoxFit.fill,
    ));
  }
}
