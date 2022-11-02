import 'package:flutter/widgets.dart';
import 'f_yc_pangrowth_novel_entity.dart';
import 'f_yc_pangrowth_novel_platform_interface.dart';

class FYcPangrowthNovel {
  ///
  /// # NovelSDK注册初始化
  ///
  /// [appName] 接入小说SDK的App的英文名 必填
  ///
  /// [appVersionName] 入小说SDKApp的版本名称 必填
  ///
  /// [appVersionCode] 接入小说SDK App的版本号 必填
  ///
  /// [channel] 埋点上传时的渠道号维度。开发者自定义字符串即可(建议不要包含test)。选填
  ///
  /// [innerOpenAdSdk] 是否自动初始化广告sdk
  ///
  /// [andoridSiteId] andorid广告appId innerOpenAdSdk = true时必填
  ///
  /// [iosAppId] ios广告appId innerOpenAdSdk = true时必填
  ///
  /// [debug] 是否实现日志
  ///
  /// [personalRecommendAd] 是否个性化推送广告
  ///
  ///  [personalRecommendContent] 是否个性化推送小说内容
  ///
  ///  [normalFontType] 全局字号大小
  ///
  ///   [readFontType] 阅读字号大小
  ///
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
    return await FYcPangrowthNovelPlatformInterface.instance.registerNovel(
        appName: appName,
        appVersionName: appVersionName,
        appVersionCode: appVersionCode,
        channel: channel,
        andoridAppId: andoridAppId,
        iosAppId: iosAppId,
        debug: debug,
        personalRecommendAd: personalRecommendAd,
        personalRecommendContent: personalRecommendContent,
        normalFontType: normalFontType,
        readFontType: readFontType);
  }

  ///# 打开小说页面
  Future<bool> openNovelPage() async {
    return await FYcPangrowthNovelPlatformInterface.instance.openNovelPage();
  }

  ///# 获取阅读历史，单本
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelHistory() async {
    return await FYcPangrowthNovelPlatformInterface.instance.getNovelHistory();
  }

  ///# 获取启动后推荐书列表，信息较少
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelRecommendV1({
    required int size,
  }) async {
    return await FYcPangrowthNovelPlatformInterface.instance
        .getNovelRecommendV1(size: size);
  }

  ///# 获取Feed推荐书列表，信息较多
  ///
  /// [size] 单次获取数量
  ///
  Future<FYcPangrowthNovelEntity> getNovelRecommendFeed({
    required int size,
  }) async {
    return await FYcPangrowthNovelPlatformInterface.instance
        .getNovelRecommendFeed(size: size);
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
    return await FYcPangrowthNovelPlatformInterface.instance
        .openNovelPageWithConfig(type: type, book: book);
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
    return await FYcPangrowthNovelPlatformInterface.instance
        .reportRecentNovelShow(type: type, book: book);
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
    return await FYcPangrowthNovelPlatformInterface.instance
        .reportRecentNovelClick(type: type, book: book);
  }

  ///# 获取小说阅读时长
  ///
  ///小说当天的阅读时长，单位为ms
  Future<int> getReadDuration() async {
    return await FYcPangrowthNovelPlatformInterface.instance.getReadDuration();
  }

  ///# 小说搜索推荐
  ///
  /// [queryContent] 搜索词
  ///
  Future<FYcPangrowthNovelEntity> searchNovelSuggestions({
    required String queryContent,
  }) async {
    return await FYcPangrowthNovelPlatformInterface.instance
        .searchNovelSuggestions(queryContent: queryContent);
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
    return await FYcPangrowthNovelPlatformInterface.instance.searchNovelResults(
        queryContent: queryContent, offset: offset, limit: limit);
  }

  ///# 打开书籍
  ///
  /// [url] 小说跳转地址
  ///
  Future<bool> openNovelPageWithUrl({
    required String url,
  }) async {
    return await FYcPangrowthNovelPlatformInterface.instance
        .openNovelPageWithUrl(url: url);
  }

  ///小说首页
  ///
  /// [viewWidth] 宽
  ///
  /// [viewHeight] 高
  ///
  Widget novelFullView(
      {required double viewWidth, required double viewHeight}) {
    return FYcPangrowthNovelPlatformInterface.instance
        .novelFullView(viewWidth: viewWidth, viewHeight: viewHeight);
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
    return FYcPangrowthNovelPlatformInterface.instance.novelEntranceView(
        viewWidth: viewWidth, viewHeight: viewHeight, type: type, style: style);
  }
}
