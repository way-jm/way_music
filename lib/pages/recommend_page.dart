import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:waymusic/http/request.dart';
import 'dart:convert';
import 'package:waymusic/models/topSong.dart';
import 'package:waymusic/widgets/topList.dart';

const APPBAR_SCROLL_OFFSET = 100;

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List _imageUrls = [
    'http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/2219362.jpeg',
    'http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/2218675.jpg',
    'http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/2191379.jpg',
    'http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/2217285.jpg',
    'http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/2215183.jpg'
  ];
  double appBarAlpha = 0;

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  _loadData() {
    HttpRequest().getTopSongs().then((res) {
      var r = json.decode(res.data);
      List list = r['data']['topList'].map((e) => TopSong.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  // 滚动且是列表滚动的时候
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 165,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_imageUrls[index],
                            fit: BoxFit.fill);
                      },
                      pagination: new SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                            size: 8,
                            activeSize: 12,
                            color: Colors.white.withOpacity(0.5),
                            activeColor: Colors.white,
                          ),
                          margin: EdgeInsets.all(10)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0,12,0,5), //容器内补白
                    child: Center(
                      child: Text("热门歌单推荐",style: TextStyle(fontSize: 16,color: Colors.amber,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  TopList(),
                  Padding(
                    padding: EdgeInsets.all(7),
                  ),
                  Container(
                      height: 800,
                      child: ListTile(
                        title: Text('哈哈'),
                      ))
                ],
              ),
            )),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
