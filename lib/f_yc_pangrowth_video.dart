import 'package:flutter/widgets.dart';

import 'entity/novel_entity.dart';
import 'f_yc_pangrowth_platform_interface_video.dart';

class YcPangrowthVideo {
  ///
  /// # NovelSDK注册初始化
  ///
  /// [appName] app名字
  ///
  /// [andoridSiteId] andorid广告appId innerOpenAdSdk = true时必填
  ///
  /// [iosAppId] ios广告appId innerOpenAdSdk = true时必填
  ///
  /// [debug] 是否实现日志
  ///
  /// [mPartner] 合作方标识，必填
  ///
  ///  [mSecureKey] 必填
  ///
  ///  [mOldPartner] 通过API方式对接的合作方身份
  ///
  ///   [mOldUUID] 通过API方式对接时传给字节的用户身份标识
  ///
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
    return await YcPangrowthPlatformVideo.instance.registerVideo(
      appName: appName,
      andoridAppId: andoridAppId,
      iosAppId: iosAppId,
      debug: debug,
      mPartner: mPartner,
      mSecureKey: mSecureKey,
      mOldPartner: mOldPartner,
      mOldUUID: mOldUUID,
    );
  }

  ///# 打开沉浸式小视频 全屏样式
  Future<bool> openDrawVideoFull() async {
    return await YcPangrowthPlatformVideo.instance.openDrawVideoFull();
  }

  ///# 打开宫格小视频 全屏样式
  Future<bool> openGridVideo() async {
    return await YcPangrowthPlatformVideo.instance.openGridVideo();
  }

  ///# 打开新闻 多列表 全屏样式
  Future<bool> openNewsTabs() async {
    return await YcPangrowthPlatformVideo.instance.openNewsTabs();
  }

  ///# 打开新闻 单列表 全屏样式
  Future<bool> openNewsTabOne() async {
    return await YcPangrowthPlatformVideo.instance.openNewsTabOne();
  }

  ///# 打开个人主页
  Future<NovelEntity> openUserCenter() async {
    return await YcPangrowthPlatformVideo.instance.openUserCenter();
  }

  ///沉浸式小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget drawVideoFullView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance
        .drawVideoFullView(viewWidth: viewWidth, viewHeight: viewHeight);
  }

  ///宫格小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget gridVideoView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.gridVideoView(
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
  Widget newsTabsView({required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.newsTabsView(
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
  Widget newsTabOneView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.newsTabOneView(
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
  Widget videoBannerView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.videoBannerView(
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
  Widget videoTextChainView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.videoTextChainView(
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
  Widget videoBubbleView({
    required double viewWidth,
    required double viewHeight,
    required String title,
  }) {
    return YcPangrowthPlatformVideo.instance.videoBubbleView(
        viewWidth: viewWidth, viewHeight: viewHeight, title: title);
  }

  ///单卡片 视频
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.videoSingleCardView(
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
  Widget videoNewsSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.videoNewsSingleCardView(
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
  Widget videoCardView(
      {required double viewWidth, required double viewHeight}) {
    return YcPangrowthPlatformVideo.instance.videoCardView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  Future<bool> getFeedNativeData() async {
    return await YcPangrowthPlatformVideo.instance.getFeedNativeData();
  }
}
