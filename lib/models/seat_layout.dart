import 'package:flutter/widgets.dart';
import 'package:seat_picker/models/seat.dart';

const _spaceHeightForDriver = 300;

enum SeatLayout {
  oneOne,
  oneTwo,
  twoOne,
  twoTwo,
  twoThree,
  threeTwo,
  ;

  double computeCellHeight(context, List<Seat> seats) {
    int rowCount = seats.last.position.row;
    double computed =
        ((MediaQuery.of(context).size.height - _spaceHeightForDriver) /
            rowCount);
    return computed;
  }

  @override
  String toString() {
    switch (this) {
      case oneOne:
        return '1-1';
      case oneTwo:
        return '1-2';
      case twoOne:
        return '2-1';
      case twoTwo:
        return '2-2';
      case twoThree:
        return '2-3';
      case threeTwo:
        return '3-2';
      default:
        return '2-2';
    }
  }

  double computeCellWidth(
    context,
  ) {
    List<String> split = toString().split('-');
    int column1Count = int.parse(split[0]);
    int column2Count = int.parse(split[1]);
    double computed = MediaQuery.of(context).size.width /
            ((column1Count + column2Count) + 1) -
        20;
    return computed;
  }
}
