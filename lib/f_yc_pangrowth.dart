
import 'f_yc_pangrowth_platform_interface.dart';

class FYcPangrowth {
  Future<String?> getPlatformVersion() {
    return FYcPangrowthPlatform.instance.getPlatformVersion();
  }
}
