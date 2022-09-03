import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'entity/novel_entity.dart';
import 'f_yc_pangrowth_method_channel_video.dart';

abstract class YcPangrowthPlatformVideo extends PlatformInterface {
  /// Constructs a FYcPangrowthPlatform.
  YcPangrowthPlatformVideo() : super(token: _token);

  static final Object _token = Object();

  static YcPangrowthPlatformVideo _instance = MethodChannelYcPangrowthVideo();

  /// The default instance of [FYcPangrowthPlatform] to use.
  ///
  /// Defaults to [MethodChannelFYcPangrowth].
  static YcPangrowthPlatformVideo get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FYcPangrowthPlatform] when
  /// they register themselves.
  static set instance(YcPangrowthPlatformVideo instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// # NovelSDK注册初始化
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
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///# 打开沉浸式小视频 全屏样式
  Future<bool> openDrawVideoFull() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///# 打开宫格小视频 全屏样式
  Future<bool> openGridVideo() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///# 打开新闻 多列表 全屏样式
  Future<bool> openNewsTabs() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///# 打开新闻 单列表 全屏样式
  Future<bool> openNewsTabOne() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///# 打开个人主页
  Future<NovelEntity> openUserCenter() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///沉浸式小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget drawVideoFullView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///宫格小视频 view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget gridVideoView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///新闻多列表view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget newsTabsView({required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///新闻单列表view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget newsTabOneView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///视频组件-banner
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoBannerView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///视频组件-文字链
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoTextChainView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
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
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///单卡片 视频
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///单卡片 信息流
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoNewsSingleCardView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///卡片 新闻
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget videoCardView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> getFeedNativeData() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
