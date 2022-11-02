import 'package:f_yc_pangrowth/src/novel/f_yc_pangrowth_novel.dart';
import 'package:f_yc_pangrowth/src/video/f_yc_pangrowth_video.dart';
export './src/novel/f_yc_pangrowth_novel.dart';
export './src/video/f_yc_pangrowth_video.dart';
export './src/novel/f_yc_pangrowth_novel_entrance_view.dart';
export './src/novel/f_yc_pangrowth_novel_full_view.dart';
export './src/video/f_yc_pangrowth_video_banner_view.dart';
export './src/video/f_yc_pangrowth_video_bubble_view.dart';
export './src/video/f_yc_pangrowth_video_card_view.dart';
export './src/video/f_yc_pangrowth_video_draw_full_view.dart';
export './src/video/f_yc_pangrowth_video_grid_view.dart';
export './src/video/f_yc_pangrowth_video_news_single_card_view.dart';
export './src/video/f_yc_pangrowth_video_news_tab_one_view.dart';
export './src/video/f_yc_pangrowth_video_news_tabs_view.dart';
export './src/video/f_yc_pangrowth_video_single_card_view.dart';
export './src/video/f_yc_pangrowth_video_textchain_view.dart';
import 'package:f_yc_config/f_yc_config.dart';

/// 初始化
class FYcPangrowth {
  static FYcPangrowthNovel pangrowthNovel = FYcPangrowthNovel();
  static FYcPangrowthVideo pangrowthVideo = FYcPangrowthVideo();

  static initializer({int initializerType = 0, bool debug = false}) async {
    FYcConfigPangrowthConfig pangrowthConfig = FYcConfigConfigurator.instance
        .getConfig(configId: KIT_CONFIG_ID)
        .pangrowthConfig;
    if (initializerType == 1 || initializerType == 0) {
      await pangrowthNovel.registerNovel(
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
      await pangrowthVideo.registerVideo(
          appName: pangrowthConfig.commonConfig.appNameEn,
          andoridAppId: pangrowthConfig.andoridAppId,
          iosAppId: pangrowthConfig.iosAppId,
          mPartner: pangrowthConfig.mPartner,
          mSecureKey: pangrowthConfig.mSecureKey,
          debug: debug);
    }
  }
}
