import 'dart:io';

import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:flutter/material.dart';

import 'video_assembly_page.dart';
import 'video_card_page.dart';
import 'video_in_page.dart';

/// @Author: gstory
/// @CreateDate: 2021/12/13 3:56 下午
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool _isRegister = false;

  @override
  void initState() {
    super.initState();
    _register();
  }

  ///初始化
  Future<void> _register() async {
    _isRegister = await YcPangrowth.pangrowthVideo.registerVideo(
      //接入小说SDK的App的英文名 必填
      appName: "appName",
      ////appid 必填
      andoridAppId: "302043",
      iosAppId: "299886",
      //是否显示日志
      debug: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('穿山甲内容合作插件---视频'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('视频--初始化: $_isRegister\n'),
            //打开沉浸式小视频
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开沉浸式小视频'),
              onPressed: () async {
                await YcPangrowth.pangrowthVideo.openDrawVideoFull();
              },
            ),
            //打开宫格小视频
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开宫格小视频'),
              onPressed: () async {
                await YcPangrowth.pangrowthVideo.openGridVideo();
              },
            ),
            //打开新闻 多列表
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开新闻 多列表'),
              onPressed: () async {
                await YcPangrowth.pangrowthVideo.openNewsTabs();
              },
            ),
            //打开新闻 单列表
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开新闻 单列表'),
              onPressed: () async {
                await YcPangrowth.pangrowthVideo.openNewsTabOne();
              },
            ),
            //打开个人主页
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开个人主页'),
              onPressed: () async {
                await YcPangrowth.pangrowthVideo.openUserCenter();
              },
            ),
            //Flutter页面中插入视频新闻界面
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('Flutter页面中插入视频新闻界面'),
              onPressed: () async {
                if (Platform.isIOS) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return VideoInPage();
                  }));
                }
              },
            ),
            //Flutter页面中插入视频新闻界面
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('视频组件'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VideoAssemblyPage();
                }));
              },
            ),
            //Flutter页面中插入视频新闻界面
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('视频卡片'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VideoCardPage();
                }));
              },
            ),
            // MaterialButton(
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: const Text('获取信息流数据'),
            //   onPressed: () async {
            //     PangrowthVideo.getFeedNativeData();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
