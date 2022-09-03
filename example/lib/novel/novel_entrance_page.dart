import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth_code.dart';
import 'package:flutter/material.dart';

/// @Author: gstory
/// @CreateDate: 2021/12/7 2:12 下午
/// @Email gstory0404@gmail.com
/// @Description: 小说导流入口控件

class NovelEntrancePage extends StatefulWidget {
  const NovelEntrancePage({Key? key}) : super(key: key);

  @override
  _NovelEntrancePageState createState() => _NovelEntrancePageState();
}

class _NovelEntrancePageState extends State<NovelEntrancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("小说入口控件"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("金刚位"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 50, //宽
                viewHeight: 50, //高
                type: YcNovelEntranceType.icon, //类型
                style: YcNovelIconSytle.circle, //类型下对应样式
              ),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 50,
                viewHeight: 50,
                type: YcNovelEntranceType.icon,
                style: YcNovelIconSytle.rect,
              ),
              const Text("悬浮球"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 50,
                viewHeight: 120,
                type: YcNovelEntranceType.floatBall,
                style: YcNovelFloatBallSytle.withClose,
              ),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 50,
                viewHeight: 120,
                type: YcNovelEntranceType.floatBall,
                style: YcNovelFloatBallSytle.withoutClose,
              ),
              const Text("Banner"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 300,
                viewHeight: 100,
                type: YcNovelEntranceType.banner,
                style: YcNovelBannerSytle.small,
              ),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 300,
                viewHeight: 150,
                type: YcNovelEntranceType.banner,
                style: YcNovelBannerSytle.medium,
              ),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 300,
                viewHeight: 200,
                type: YcNovelEntranceType.banner,
                style: YcNovelBannerSytle.large,
              ),
              const Text("Window"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 300,
                viewHeight: 100,
                type: YcNovelEntranceType.window,
                style: YcNovelWindowSytle.color1,
              ),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 300,
                viewHeight: 100,
                type: YcNovelEntranceType.window,
                style: YcNovelWindowSytle.color2,
              ),
              const Text("Feed单本"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 400,
                viewHeight: 200,
                type: YcNovelEntranceType.feedSingle,
                style: YcNovelFeedSytle.normal,
              ),
              const Text("Feed多本"),
              YcPangrowth.pangrowthNovel.novelEntranceView(
                viewWidth: 400,
                viewHeight: 500,
                type: YcNovelEntranceType.feedList,
                style: YcNovelFeedSytle.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
