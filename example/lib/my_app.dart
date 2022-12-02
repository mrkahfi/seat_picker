import 'package:flutter/material.dart';
import 'package:seat_picker/models/seat_layout.dart';
import 'package:seat_picker/seat_picker.dart';
import 'package:seat_picker/widgets/my_bus_button.dart';

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
                    bookedSeatAsset: 'assets/images/seat_booked.png',
                    freeSeatAsset: 'assets/images/seat_free.png',
                    selectedSeatAsset: 'assets/images/seat_selected.png',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MyBusButton(
                    'OK',
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )),
    );
  }
}
