import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:seat_picker/models/seat_layout.dart';
import 'package:seat_picker/seat_picker.dart';
import 'package:seat_picker/widgets/my_bus_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await SeatPicker.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

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
                    bookedSeats: [],
                    seatLayout: SeatLayout.twoTwo,
                    onSeatSelected: (seats, seat) {
                      print('seats ${seats.length}, seat: ${seat.no}');
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
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
