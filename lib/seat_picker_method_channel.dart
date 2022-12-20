import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'seat_picker_platform_interface.dart';

/// An implementation of [SeatPickerPlatform] that uses method channels.
class MethodChannelSeatPicker extends SeatPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('seat_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
