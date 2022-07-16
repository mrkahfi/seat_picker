import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:seat_picker/models/seat.dart';

part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {
  List<Seat> seats = [];

  SeatBloc() : super(SeatInitial());

  @override
  Stream<SeatState> mapEventToState(
    SeatEvent event,
  ) async* {
    if (event is SetSeats) {
      seats = event.seats;
      yield SeatAdded(seats: seats);
    } else if (event is AddSeat) {
      seats.add(event.seat);
      yield SeatAdded(seats: seats);
    } else if (event is RemoveSeat) {
      for (var seat in seats) {}
      seats.removeWhere((element) => element == event.seat);
      yield SeatRemoved(seats: seats);
    }
  }
}
