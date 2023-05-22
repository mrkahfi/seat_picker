import 'package:flutter/material.dart';
import 'package:seat_picker/gen/assets.gen.dart';
import 'package:seat_picker/models/seat_layout.dart';
import 'package:seat_picker/seat_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SeatPicker(
                    allSeats: SeatPicker.loadSeats(),
                    bookedSeats: const [],
                    seatLayout: SeatLayout.twoTwo,
                    onSeatSelected: (seats, seat) {
                      debugPrint('seats ${seats.length}, seat: ${seat.no}');
                    },
                    bookedSeatAsset:
                        Assets.images.seatBooked.image(package: 'seat_picker'),
                    freeSeatAsset:
                        Assets.images.seatFree.image(package: 'seat_picker'),
                    selectedSeatAsset: Assets.images.seatSelected
                        .image(package: 'seat_picker'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )),
    );
  }
}
