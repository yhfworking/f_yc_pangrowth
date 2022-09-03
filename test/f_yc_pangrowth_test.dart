import 'package:flutter_test/flutter_test.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth_platform_interface.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFYcPangrowthPlatform 
    with MockPlatformInterfaceMixin
    implements FYcPangrowthPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FYcPangrowthPlatform initialPlatform = FYcPangrowthPlatform.instance;

  test('$MethodChannelFYcPangrowth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFYcPangrowth>());
  });

  test('getPlatformVersion', () async {
    FYcPangrowth fYcPangrowthPlugin = FYcPangrowth();
    MockFYcPangrowthPlatform fakePlatform = MockFYcPangrowthPlatform();
    FYcPangrowthPlatform.instance = fakePlatform;
  
    expect(await fYcPangrowthPlugin.getPlatformVersion(), '42');
  });
}
