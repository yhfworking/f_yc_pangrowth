import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_yc_pangrowth/f_yc_pangrowth_method_channel.dart';

void main() {
  MethodChannelFYcPangrowth platform = MethodChannelFYcPangrowth();
  const MethodChannel channel = MethodChannel('f_yc_pangrowth');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
