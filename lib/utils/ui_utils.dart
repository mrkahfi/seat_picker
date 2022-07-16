import 'package:flutter/material.dart';
import 'package:seat_picker/models/seat.dart';

class UiUtils {
  static double computeCellHeight(context, List<Seat> seats) {
    int rowCount = seats.last.position.row;
    double computed = ((MediaQuery.of(context).size.height - 300) / rowCount);
    return computed;
  }

  static double computeCellWidth(context, String seatLayout) {
    List<String> split = seatLayout.split('-');
    int column1Count = int.parse(split[0]);
    int column2Count = int.parse(split[1]);
    double computed = MediaQuery.of(context).size.width /
            ((column1Count + column2Count) + 1) -
        20;
    return computed;
  }
}
