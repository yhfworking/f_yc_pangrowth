import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:flutter/material.dart';

/// @Author: gstory
/// @CreateDate: 2021/12/13 3:56 下午
/// @Email gstory0404@gmail.com
/// @Description: 视频卡片

class VideoCardPage extends StatefulWidget {
  const VideoCardPage({Key? key}) : super(key: key);

  @override
  _VideoBannerPageState createState() => _VideoBannerPageState();
}

class _VideoBannerPageState extends State<VideoCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('视频卡片'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("视频卡片-单视频"),
            YcPangrowth.pangrowthVideo
                .videoSingleCardView(viewWidth: 160, viewHeight: 200),
            const Text("视频卡片-单信息流"),
            YcPangrowth.pangrowthVideo
                .videoNewsSingleCardView(viewWidth: 160, viewHeight: 200),
            const Text("视频卡片-列表"),
            YcPangrowth.pangrowthVideo
                .videoCardView(viewWidth: 400, viewHeight: 200),
          ],
        ),
      ),
    );
  }
}
