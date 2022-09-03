import 'package:flutter/services.dart';

/// 广告事件回调监听
typedef OnAdEventListener = void Function(Map eventData);

class EventChannelFYcPangrowth {
  static const eventChannel = EventChannel('f_yc_pangrowth_event');

  ///事件回调
  ///@params onData 事件回调
  static Future<void> onEventListener(OnAdEventListener listener) async {
    EventChannelFYcPangrowth.eventChannel
        .receiveBroadcastStream()
        .listen((eventData) {
      listener(eventData);
    });
  }
}
