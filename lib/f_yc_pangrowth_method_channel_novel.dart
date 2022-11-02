import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'entity/novel_entity.dart';
import 'f_yc_pangrowth_code.dart';
import 'f_yc_pangrowth_platform_interface_novel.dart';
import 'novel_entrance/novel_entrance_view.dart';
import 'novel_full_view/novel_full_view.dart';

/// An implementation of [FYcPangrowthPlatform] that uses method channels.
class MethodChannelYcPangrowthNovel extends YcPangrowthPlatformNovel {
  /// The method channel used to interact with the native platform.
  // @visibleForTesting
  final methodChannel = const MethodChannel('f_yc_pangrowth_method');

  @override
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
    return await methodChannel.invokeMethod("registerNovel", {
      "appName": appName,
      "appVersionName": appVersionName,
      "appVersionCode": appVersionCode,
      "channel": channel ?? "",
      "andoridAppId": andoridAppId,
      "iosAppId": iosAppId,
      "debug": debug ?? false,
      "personalRecommendAd": personalRecommendAd ?? true,
      "personalRecommendContent": personalRecommendContent ?? true,
      "normalFontType": normalFontType ?? YcNormalFontSize.normal,
      "readFontType": readFontType ?? YcReadFontSize.two,
    });
  }

  @override
  Future<bool> openNovelPage() async {
    return await methodChannel.invokeMethod("openNovelPage", null);
  }

  @override
  Future<NovelEntity> getNovelHistory() async {
    dynamic data = await methodChannel.invokeMethod("getNovelHistory", {
      "size": 1,
    });
    return NovelEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<NovelEntity> getNovelRecommendV1({
    required int size,
  }) async {
    dynamic data = await methodChannel.invokeMethod("getNovelRecommendV1", {
      "size": size,
    });
    return NovelEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<NovelEntity> getNovelRecommendFeed({
    required int size,
  }) async {
    dynamic data = await methodChannel.invokeMethod("getNovelRecommendFeed", {
      "size": size,
    });
    if (kDebugMode) {
      print("结果 =》$data");
    }
    return NovelEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<bool> openNovelPageWithConfig({
    required int type,
    required String book,
  }) async {
    return await methodChannel.invokeMethod("openNovelPageWithConfig", {
      "type": type,
      "book": book,
    });
  }

  @override
  Future<bool> reportRecentNovelShow({
    required int type,
    required String book,
  }) async {
    return await methodChannel.invokeMethod("reportRecentNovelShow", {
      "type": type,
      "book": book,
    });
  }

  @override
  Future<bool> reportRecentNovelClick({
    required int type,
    required String book,
  }) async {
    return await methodChannel.invokeMethod("reportRecentNovelClick", {
      "type": type,
      "book": book,
    });
  }

  @override
  Future<int> getReadDuration() async {
    return await methodChannel.invokeMethod("getReadDuration");
  }

  @override
  Future<NovelEntity> searchNovelSuggestions({
    required String queryContent,
  }) async {
    dynamic data = await methodChannel.invokeMethod("searchNovelSuggestions", {
      "queryContent": queryContent,
    });
    return NovelEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<NovelEntity> searchNovelResults({
    required String queryContent,
    required int offset,
    required int limit,
  }) async {
    if (kDebugMode) {
      print("开始搜索$queryContent");
    }
    dynamic data = await methodChannel.invokeMethod("searchNovelResults", {
      "queryContent": queryContent,
      "offset": offset,
      "limit": limit,
    });
    if (kDebugMode) {
      print("搜索结果$data");
    }
    return NovelEntity.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<bool> openNovelPageWithUrl({
    required String url,
  }) async {
    return await methodChannel.invokeMethod("openNovelPageWithUrl", {
      "url": url,
    });
  }

  @override
  Widget novelFullView(
      {required double viewWidth, required double viewHeight}) {
    return NovelFullView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
    );
  }

  @override
  Widget novelEntranceView(
      {required double viewWidth,
      required double viewHeight,
      required String type,
      required String style}) {
    return NovelEntranceView(
      viewWidth: viewWidth,
      viewHeight: viewHeight,
      type: type,
      style: style,
    );
  }
}
