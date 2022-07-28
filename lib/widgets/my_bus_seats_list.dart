import 'package:flutter/material.dart';
import 'package:seat_picker/models/seat.dart';

class MyBusSeatsListWidget extends StatelessWidget {
  final List<Seat> seats;

  const MyBusSeatsListWidget({Key? key, required this.seats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> seatWidgets = [];
    for (var seat in seats) {
      seatWidgets.add(Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.all(5),
        child: Text(
          seat.no,
          style: const TextStyle(
              fontFamily: 'SFPro', fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: seatWidgets,
    );
  }
}
