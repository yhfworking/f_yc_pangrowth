#import "FYcPangrowthPlugin.h"
#import "NovelPlugin.h"
#import "BDNovelPublicConfig.h"
#import "novel/novel_entrance/NovelEntranceView.h"
#import "novel/novel_full_view/NovelFullView.h"
#import "video/VideoPlugin.h"
#import "video/view/DrawVideoFullView.h"
#import "video/view/NewsTabsView.h"
#import "video/view/NewsTabOneView.h"
#import "video/view/GridVideoView.h"
#import "video/view/VideoBannerView.h"
#import "video/view/VideoTextChainView.h"
#import "video/view/VideoBubbleView.h"
#import "video/view/VideoSingleCardView.h"
#import "video/view/VideoNewsSingleCardView.h"
#import "video/view/VideoCardView.h"

@implementation FYcPangrowthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"f_yc_pangrowth_method"
            binaryMessenger:[registrar messenger]];
  FYcPangrowthPlugin* instance = [[FYcPangrowthPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
   //注册首页控件
  [registrar registerViewFactory:[[NovelFullViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_novel/FullView"];
  //注册小说入口控件
    [registrar registerViewFactory:[[NovelEntranceViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_novel/EntranceView"];
    //沉浸式小视频view
    [registrar registerViewFactory:[[DrawVideoFullViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/FullView"];
    //宫格小视频view
    [registrar registerViewFactory:[[GridVideoViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/GridVideoView"];
    //新闻多列表view
    [registrar registerViewFactory:[[NewsTabsViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/NewsTabsView"];
    //新闻单列表view
    [registrar registerViewFactory:[[NewsTabOneViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/NewsTabOneView"];
    //视频组件-banner
    [registrar registerViewFactory:[[VideoBannerViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/BannerView"];
    //视频组件-文字链
    [registrar registerViewFactory:[[VideoTextChainViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/TextChainView"];
    //视频组件-气泡
    [registrar registerViewFactory:[[VideoBubbleViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/BubbleView"];
    //视频 单卡片视频
    [registrar registerViewFactory:[[VideoSingleCardViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/SingleCardView"];
    //视频 单卡片新闻
    [registrar registerViewFactory:[[VideoNewsSingleCardViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/NewsSingleCardView"];
    //视频 卡片
    [registrar registerViewFactory:[[VideoCardViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"f_yc_pangrowth_video/CardView"];
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  //初始化小说
    if ([@"registerNovel" isEqualToString:call.method]) {
        [NovelPlugin registerNovel:call.arguments result:result];
        //打开小说主页
    }else if([@"openNovelPage" isEqualToString:call.method]){
        [NovelPlugin openNovelPage:call.arguments result:result ];
        //获取阅读历史，单本
    }else if([@"getNovelHistory" isEqualToString:call.method]){
        [NovelPlugin getNovelHistory:call.arguments result:result ];
        //获取启动后推荐书列表，信息较少
    }else if([@"getNovelRecommendV1" isEqualToString:call.method]){
        [NovelPlugin getNovelRecommendV1:call.arguments result:result];
        //获取Feed推荐书列表，信息较多
    }else if([@"getNovelRecommendFeed" isEqualToString:call.method]){
        [NovelPlugin getNovelRecommendFeed:call.arguments result:result];
        //打开小说页面
    }else if([@"openNovelPageWithConfig" isEqualToString:call.method]){
        [NovelPlugin openNovelPageWithConfig:call.arguments result:result];
        //打开小说页面url
    }else if([@"openNovelPageWithUrl" isEqualToString:call.method]){
        [NovelPlugin openNovelPageWithUrl:call.arguments result:result];
        //为了更精准推荐书籍，当显示getReadConfigWithParam获得的书时，调用此接口,上报埋点增强推荐能力
    }else if([@"reportRecentNovelShow" isEqualToString:call.method]){
        [NovelPlugin reportRecentNovelShow:call.arguments result:result ];
        //获取小说阅读时长
    }else if([@"getReadDuration" isEqualToString:call.method]){
        NSUInteger duration = [BDNovelPublicConfig getReadDuration];
        result(@(duration));
        // 小说搜索推荐
    }else if([@"searchNovelSuggestions" isEqualToString:call.method]){
        [NovelPlugin searchNovelSuggestions:call.arguments result:result];
        // 小说搜索结果
    }else if([@"searchNovelResults" isEqualToString:call.method]){
        [NovelPlugin searchNovelResults:call.arguments result:result];
        //视频初始化
    }else if([@"registerVideo" isEqualToString:call.method]){
        [VideoPlugin registerVideo:call.arguments result:result];
        //打开沉浸式小视频场景展示：全屏样式
    }else if([@"openDrawVideoFull" isEqualToString:call.method]){
        [VideoPlugin openDrawVideoFull];
        //打开宫格小视频：全屏样式
    }else if([@"openGridVideo" isEqualToString:call.method]){
        [VideoPlugin openGridVideo];
        //打开新闻 多列表 全屏样式
    }else if([@"openNewsTabs" isEqualToString:call.method]){
        [VideoPlugin openNewsTabs];
        //打开新闻 单列表 全屏样式
    }else if([@"openNewsTabOne" isEqualToString:call.method]){
        [VideoPlugin openNewsTabOne];
        //打开个人主页
    }else if([@"openUserCenter" isEqualToString:call.method]){
        [VideoPlugin openUserCenter];
        //获取信息流数据
    }else if([@"getFeedNativeData" isEqualToString:call.method]){
        [VideoPlugin getFeedNativeData:call.arguments result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
