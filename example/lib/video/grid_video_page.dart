import 'dart:ui';
import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:flutter/material.dart';

/// @Author: gstory
/// @CreateDate: 2021/12/15 9:55 上午
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class GridVideoPage extends StatefulWidget {
  const GridVideoPage({Key? key}) : super(key: key);

  @override
  _DrawVideoPageState createState() => _DrawVideoPageState();
}

class _DrawVideoPageState extends State<GridVideoPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YcPangrowth.pangrowthVideo.gridVideoView(
          viewWidth: MediaQuery.of(context).size.width, viewHeight: 700),
    );
  }
}
