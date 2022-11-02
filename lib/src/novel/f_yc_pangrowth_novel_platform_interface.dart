import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'f_yc_pangrowth_novel_entity.dart';
import 'f_yc_pangrowth_novel_method_channel.dart';

abstract class FYcPangrowthNovelPlatformInterface extends PlatformInterface {
  FYcPangrowthNovelPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static FYcPangrowthNovelPlatformInterface _instance =
      FYcPangrowthNovelMethodChannel();

  /// The default instance of [FYcPangrowthPlatform] to use.
  ///
  /// Defaults to [MethodChannelFYcPangrowth].
  static FYcPangrowthNovelPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FYcPangrowthPlatform] when
  /// they register themselves.
  static set instance(FYcPangrowthNovelPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// # NovelSDK注册初始化
  Future<bool> registerNovel({
    required String appName,
    required String appVersionName,
    required int appVersionCode,
    String? channel,
    required String andoridAppId,
    required String iosAppId,
    bool? debug,
    bool? personalRecommendAd,
    bool? personalRecommendContent,
    String? normalFontType,
    String? readFontType,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 打开小说页面
  Future<bool> openNovelPage() async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 获取阅读历史，单本
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelHistory() async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 获取启动后推荐书列表，信息较少
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelRecommendV1({
    required int size,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 获取Feed推荐书列表，信息较多
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelRecommendFeed({
    required int size,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 打开书籍
  ///
  /// [size] 类型 0历史记录 1启动后推荐书 2Feed推荐书
  ///
  /// [book] 书籍json
  ///
  Future<bool> openNovelPageWithConfig({
    required int type,
    required String book,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 为了更精准推荐书籍，当显示历史、feed推荐书时，调用此接口,上报埋点增强推荐能力
  ///
  /// [type] 类型 0历史记录 1启动后推荐书 2Feed推荐书
  ///
  /// [book] 书籍json
  ///
  Future<bool> reportRecentNovelShow({
    required int type,
    required String book,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///#当点击历史、feed推荐书时，调用此接口
  ///
  /// [type] 类型 0历史记录 1启动后推荐书 2Feed推荐书
  ///
  /// [book] 书籍json
  ///
  Future<bool> reportRecentNovelClick({
    required int type,
    required String book,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 获取小说阅读时长
  ///
  ///小说当天的阅读时长，单位为ms
  Future<int> getReadDuration() async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 小说搜索推荐
  ///
  /// [queryContent] 搜索词
  ///
  Future<FYcPangrowthNovelEntity> searchNovelSuggestions({
    required String queryContent,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 小说搜索结果
  ///
  /// [queryContent] 搜索词
  ///
  Future<FYcPangrowthNovelEntity> searchNovelResults({
    required String queryContent,
    required int offset,
    required int limit,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///# 打开书籍
  ///
  /// [url] 小说跳转地址
  ///
  Future<bool> openNovelPageWithUrl({
    required String url,
  }) async {
    throw UnimplementedError('method has not been implemented.');
  }

  ///小说首页
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget novelFullView(
      {required double viewWidth, required double viewHeight}) {
    throw UnimplementedError('method has not been implemented.');
  }

  ///小说入口view
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  /// [type] 类型
  ///
  /// [style] 样式
  ///
  Widget novelEntranceView(
      {required double viewWidth,
      required double viewHeight,
      required String type,
      required String style}) {
    throw UnimplementedError('method has not been implemented.');
  }
}
