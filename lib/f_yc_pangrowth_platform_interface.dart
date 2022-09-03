import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'f_yc_pangrowth_method_channel.dart';

abstract class FYcPangrowthPlatform extends PlatformInterface {
  /// Constructs a FYcPangrowthPlatform.
  FYcPangrowthPlatform() : super(token: _token);

  static final Object _token = Object();

  static FYcPangrowthPlatform _instance = MethodChannelFYcPangrowth();

  /// The default instance of [FYcPangrowthPlatform] to use.
  ///
  /// Defaults to [MethodChannelFYcPangrowth].
  static FYcPangrowthPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FYcPangrowthPlatform] when
  /// they register themselves.
  static set instance(FYcPangrowthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
