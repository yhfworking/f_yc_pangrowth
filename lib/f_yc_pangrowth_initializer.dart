import 'dart:developer';

import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pangrowth/src/novel/f_yc_pangrowth_novel.dart';
import 'package:f_yc_pangrowth/src/video/f_yc_pangrowth_video.dart';

/// 初始化
class FYcPangrowthInitializer {
  static initializer({int initializerType = 0, bool debug = false}) async {
    FYcConfigPangrowthConfig pangrowthConfig = FYcConfigConfigurator.instance
        .getConfig(configId: KIT_CONFIG_ID)
        .pangrowthConfig;
    log('---FYcPangrowthInitializer----${pangrowthConfig.commonConfig.appNameEn}');
    if (initializerType == 1 || initializerType == 0) {
      await FYcPangrowthNovel().registerNovel(
          appName: pangrowthConfig.commonConfig.appNameEn,
          andoridAppId: pangrowthConfig.andoridAppId,
          iosAppId: pangrowthConfig.iosAppId,
          appVersionName: '1.2.2',
          appVersionCode: 100,
          personalRecommendAd: true,
          personalRecommendContent: true,
          debug: debug);
    }
    if (initializerType == 2 || initializerType == 0) {
      await FYcPangrowthVideo().registerVideo(
          appName: pangrowthConfig.commonConfig.appNameEn,
          andoridAppId: pangrowthConfig.andoridAppId,
          iosAppId: pangrowthConfig.iosAppId,
          mPartner: pangrowthConfig.mPartner,
          mSecureKey: pangrowthConfig.mSecureKey,
          debug: debug);
    }
  }
}
