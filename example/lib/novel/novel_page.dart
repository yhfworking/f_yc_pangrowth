import 'dart:async';
import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth_code.dart';
import 'package:flutter/material.dart';
import 'novel_entrance_page.dart';
import 'novel_recommend_page.dart';
import 'novel_search_delegate.dart';

/// @Author: gstory
/// @CreateDate: 2021/12/6 4:38 下午
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class NovelPage extends StatefulWidget {
  const NovelPage({Key? key}) : super(key: key);

  @override
  _NovelPageState createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  bool _isRegister = false;
  int _duration = 0;
  StreamSubscription? _adViewStream;
  var a = 0;

  @override
  void initState() {
    super.initState();
    _register();
  }

  ///初始化
  Future<void> _register() async {
    await YcPangrowth.pangrowthNovel.registerNovel(
      //接入小说SDK的App的英文名 必填
      appName: "appName",
      ////接入小说SDKApp的版本名称 必填
      appVersionName: "1.0.0",
      //接入小说SDK App的版本号 必填
      appVersionCode: 1,
      //埋点上传时的渠道号维度。开发者自定义字符串即可(建议不要包含test)。选填
      channel: "test",
      ////appid 必填
      andoridAppId: "302043",
      iosAppId: "299886",
      //是否显示日志
      debug: true,
      //是否个性化推送广告
      personalRecommendAd: true,
      //是否个性化推送小说内容
      personalRecommendContent: true,
      //全局字号大小
      normalFontType: YcNormalFontSize.normal,
      //阅读字号大小
      readFontType: YcReadFontSize.one,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _adViewStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('穿山甲内容合作插件---小说'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('小说--初始化: $_isRegister\n'),
            Text('阅读时长: $_duration\n'),
            //激励广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('打开小说页面'),
              onPressed: () async {
                await YcPangrowth.pangrowthNovel.openNovelPage();
              },
            ),
            //获取阅读历史，单本
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('阅读历史'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return NovelRecommendPage(type: "hisotry");
                }));
              },
            ),
            //获取启动后推荐书列表，信息较少
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('启动后推荐书列表'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return NovelRecommendPage(type: "feedV1");
                }));
              },
            ),
            //获取Feed推荐书列表，信息较多
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('Feed推荐书列表'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return NovelRecommendPage(type: "feed");
                }));
              },
            ),
            //获取Feed推荐书列表，信息较多
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('获取阅读时常'),
              onPressed: () async {
                _duration = await YcPangrowth.pangrowthNovel.getReadDuration();
                setState(() {});
              },
            ),
            //搜索小说
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('搜索小说'),
              onPressed: () async {
                showSearch(context: context, delegate: SearchNovelDelegate());
                // FlutterPangrowth.searchNovelResults(queryContent: "123", offset: 1, limit: 20);
              },
            ),
            //小说入口
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('小说入口控件'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const NovelEntrancePage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
