import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seat_picker/seat_picker_method_channel.dart';

void main() {
  MethodChannelSeatPicker platform = MethodChannelSeatPicker();
  const MethodChannel channel = MethodChannel('seat_picker');

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
