import 'dart:developer';

import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pangrowth/src/novel/f_yc_pangrowth_novel.dart';
import 'package:f_yc_pangrowth/src/video/f_yc_pangrowth_video.dart';

/// 初始化
class FYcPangrowthInitializer {
  static initializer(FYcConfigAllConfig allConfig,
      {int initializerType = 0, bool debug = false}) async {
    log('---FYcPangrowthInitializer----${allConfig.commonConfig.appNameEn}');
    if (initializerType == 1 || initializerType == 0) {
      await FYcPangrowthNovel().registerNovel(
          appName: allConfig.commonConfig.appNameEn,
          andoridAppId: allConfig.pangrowthConfig.andoridAppId,
          iosAppId: allConfig.pangrowthConfig.iosAppId,
          appVersionName: '1.2.2',
          appVersionCode: 100,
          personalRecommendAd: true,
          personalRecommendContent: true,
          debug: debug);
    }
    if (initializerType == 2 || initializerType == 0) {
      await FYcPangrowthVideo().registerVideo(
          appName: allConfig.commonConfig.appNameEn,
          andoridAppId: allConfig.pangrowthConfig.andoridAppId,
          iosAppId: allConfig.pangrowthConfig.iosAppId,
          mPartner: allConfig.pangrowthConfig.mPartner,
          mSecureKey: allConfig.pangrowthConfig.mSecureKey,
          debug: debug);
    }
  }
}
