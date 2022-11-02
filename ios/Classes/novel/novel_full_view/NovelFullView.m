//
//  NovelFullView.m
//  BURelyFoundation
//
//  Created by yhfwork on 2022/5/22.
//

#import "NovelFullView.h"
#import "BDNovelPublicConfig.h"

@interface NovelFullViewFactory()

@end

@implementation NovelFullViewFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    NovelFullView *view = [[NovelFullView alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return view;
}

@end

@interface NovelFullView()
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *methodChannel;
//@property(nonatomic,assign) double width;
//@property(nonatomic,assign) double height;
@property(nonatomic,strong) UIViewController *uvc;

@end

@implementation NovelFullView

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSLog(@"%@",args);
        NSDictionary *nsd = args;
        _viewId = viewId;
//        NSNumber *viewWidth = nsd[@"viewWidth"];
//        NSNumber *viewHeight = nsd[@"viewHeight"];
//        _width =[viewWidth doubleValue];
//        _height =[viewHeight doubleValue];
        NSString* channelName = [NSString stringWithFormat:@"f_yc_pangrowth_novel/FullView_%lld", viewId];
        _methodChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
//        _container= [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
        UIViewController *vc = [BDNovelPublicConfig novelViewControllerWithType:BDNovelPublicEnTranceTypeChannelPage userInfo:nil];
        _uvc = [[UIViewController alloc] init];
        [_uvc addChildViewController:vc];
//        vc.view.frame = CGRectMake(0, 0, _width, _height);
//        _uvc.view.frame = CGRectMake(0, 0, _width, _height);
        [_uvc.view removeFromSuperview];
        [_uvc.view addSubview:vc.view];
    }
    return self;
}

- (nonnull UIView *)view {
    return _uvc.view;
}

@end
