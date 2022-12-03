import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:seat_picker/gen/assets.gen.dart';
import 'package:seat_picker/models/seat_layout.dart';
import 'package:seat_picker/seat_picker.dart';
import 'package:seat_picker/seat_picker_platform_interface.dart';
import 'package:seat_picker/seat_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSeatPickerPlatform
    with MockPlatformInterfaceMixin
    implements SeatPickerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SeatPickerPlatform initialPlatform = SeatPickerPlatform.instance;

  test('$MethodChannelSeatPicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSeatPicker>());
  });

  test('getPlatformVersion', () async {
    SeatPicker seatPickerPlugin = SeatPicker(
      allSeats: SeatPicker.loadSeats(),
      bookedSeats: const [],
      seatLayout: SeatLayout.twoTwo,
      onSeatSelected: (seats, seat) {
        log('seats ${seats.length}, seat: ${seat.no}');
      },
      bookedSeatAsset: Assets.images.seatBooked.image(),
      freeSeatAsset: Assets.images.seatFree.image(),
      selectedSeatAsset: Assets.images.seatSelected.image(),
    );
    MockSeatPickerPlatform fakePlatform = MockSeatPickerPlatform();
    SeatPickerPlatform.instance = fakePlatform;
  });
}
