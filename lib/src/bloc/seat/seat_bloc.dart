import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:seat_picker/models/seat.dart';

part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {
  List<Seat> seats = [];

  SeatBloc(SeatState initialState) : super(initialState) {
    on<SetSeats>(_onSetSeats);
    on<AddSeat>(_onAddSeat);
    on<RemoveSeat>(_onRemoveSeat);
  }

  FutureOr<void> _onSetSeats(SetSeats event, Emitter<SeatState> emit) {
    seats = event.seats;
    emit(SeatsSeat(seats: seats));
  }

  FutureOr<void> _onAddSeat(AddSeat event, Emitter<SeatState> emit) {
    seats.add(event.seat);
    emit(SeatAdded(seats: seats, seat: event.seat));
  }

  FutureOr<void> _onRemoveSeat(RemoveSeat event, Emitter<SeatState> emit) {
    seats.removeWhere((element) => element == event.seat);
    emit(SeatRemoved(seats: seats, seat: event.seat));
  }
}
