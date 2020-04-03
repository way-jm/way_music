import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const list1 = [
  {
    "dissid": "7382629476",
    "createtime": "2020-03-02",
    "commit_time": "2020-03-02",
    "dissname": "精选 | 好听到单曲循环的热歌",
    "imgurl": "http://p.qpic.cn/music_cover/Z89aLA93LOSOicz0QOnMboqgLaiaFohjweglHh6JSoL8hrjOfFOC6DXw/600?n=1",
    "introduction": "",
    "listennum": 178182716,
    "score": 0,
    "version": 0,
    "creator": {
      "type": 2,
      "qq": 1968987427,
      "encrypt_uin": "oKEsNeEF7ivA7z**",
      "name": "故事未完待续",
      "isVip": 2,
      "avatarUrl": "",
      "followflag": 0
    }
  }
];
class TopList extends StatelessWidget{
  TopList({Key key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
        children: _topList(context, list1),
    );
  }

  _topList(BuildContext context,List list){
    List<Widget> items = [];
    list.forEach((item){
      items.add(_topListItem( context,item));
    });
    return items;
  }

  _topListItem(BuildContext context,item){
    return Row(
      children: <Widget>[
        Text(" hello world "),
        Text(" I am Jack 111"),
      ],
    );

  }



}