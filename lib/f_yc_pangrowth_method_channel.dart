import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'f_yc_pangrowth_platform_interface.dart';

/// An implementation of [FYcPangrowthPlatform] that uses method channels.
class MethodChannelFYcPangrowth extends FYcPangrowthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('f_yc_pangrowth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
