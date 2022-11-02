import 'package:f_yc_pangrowth/video/news_tabs_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'entity/novel_entity.dart';
import 'f_yc_pangrowth_platform_interface_video.dart';
import 'video/draw_video_full_view.dart';
import 'video/grid_video_view.dart';
import 'video/news_tab_one_view.dart';
import 'video/video_banner_view.dart';
import 'video/video_bubble_view.dart';
import 'video/video_card_view.dart';
import 'video/video_news_single_card_view.dart';
import 'video/video_single_card_view.dart';
import 'video/video_textchain_view.dart';

/// An implementation of [FYcPangrowthPlatform] that uses method channels.
class MethodChannelYcPangrowthVideo extends YcPangrowthPlatformVideo {
  /// The method channel used to interact with the native platform.
  // @visibleForTesting
  final methodChannel = const MethodChannel('f_yc_pangrowth_method');

  /// # NovelSDK注册初始化
  @override
  Future<bool> registerVideo({
    required String appName,
    required String andoridAppId,
    required String iosAppId,
    bool? debug,
    String? mPartner,
    String? mSecureKey,
    String? mOldPartner,
    String? mOldUUID,
  }) async {
    return await methodChannel.invokeMethod("registerVideo", {
      "andoridAppId": andoridAppId,
      "iosAppId": iosAppId,
      "debug": debug ?? false,
      "mPartner": mPartner,
      "mSecureKey": mSecureKey,
      "mOldPartner": mOldPartner,
      "mOldUUID": mOldUUID,
    });
  }

  ///# 打开沉浸式小视频 全屏样式
  @override
  Future<bool> openDrawVideoFull() async {
    return await methodChannel.invokeMethod("openDrawVideoFull", null);
  }

  ///# 打开宫格小视频 全屏样式
  @override
  Future<bool> openGridVideo() async {
    return await methodChannel.invokeMethod("openGridVideo", null);
  }

  ///# 打开新闻 多列表 全屏样式
  @override
  Future<bool> openNewsTabs() async {
    return await methodChannel.invokeMethod("openNewsTabs", null);
  }

  ///# 打开新闻 单列表 全屏样式
  @override
  Future<bool> openNewsTabOne() async {
    return await methodChannel.invokeMethod("openNewsTabOne", null);
  }

  ///# 打开个人主页
  @override
  Future<NovelEntity> openUserCenter() async {
    return await methodChannel.invokeMethod("openUserCenter", null);
  }

  ///沉浸式小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget drawVideoFullView(
      {required double viewWidth, required double viewHeight}) {
    return DrawVideoFullView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///宫格小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget gridVideoView(
      {required double viewWidth, required double viewHeight}) {
    return GridVideoView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///新闻多列表view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget newsTabsView({required double viewWidth, required double viewHeight}) {
    return NewsTabsView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///新闻单列表view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget newsTabOneView(
      {required double viewWidth, required double viewHeight}) {
    return NewsTabOneView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///视频组件-banner
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoBannerView(
      {required double viewWidth, required double viewHeight}) {
    return VideoBannerView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///视频组件-文字链
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoTextChainView(
      {required double viewWidth, required double viewHeight}) {
    return VideoTextChainView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///视频组件-气泡
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoBubbleView({
    required double viewWidth,
    required double viewHeight,
    required String title,
  }) {
    return VideoBubbleView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
      title: title,
    );
  }

  ///单卡片 视频
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    return VideoSingleCardView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///单卡片 信息流
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoNewsSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    return VideoNewsSingleCardView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  ///卡片 新闻
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  @override
  Widget videoCardView(
      {required double viewWidth, required double viewHeight}) {
    return VideoCardView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  @override
  Future<bool> getFeedNativeData() async {
    return await methodChannel.invokeMethod("getFeedNativeData", null);
  }
}
