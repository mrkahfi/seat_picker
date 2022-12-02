import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'seat_picker_method_channel.dart';

abstract class SeatPickerPlatform extends PlatformInterface {
  /// Constructs a SeatPickerPlatform.
  SeatPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static SeatPickerPlatform _instance = MethodChannelSeatPicker();

  /// The default instance of [SeatPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelSeatPicker].
  static SeatPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SeatPickerPlatform] when
  /// they register themselves.
  static set instance(SeatPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
