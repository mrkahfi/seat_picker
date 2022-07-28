part of 'seat_bloc.dart';

@immutable
abstract class SeatState {}

class SeatInitial extends SeatState {
  SeatInitial();
}

class SeatsSeat extends SeatState {
  final List<Seat> seats;
  SeatsSeat({required this.seats});

  @override
  String toString() => 'SeatsAdded';
}

class SeatAdded extends SeatState {
  final List<Seat> seats;
  final Seat seat;
  SeatAdded({required this.seats, required this.seat});

  @override
  String toString() => 'SeatAdded';
}

class SeatRemoved extends SeatState {
  final List<Seat> seats;
  final Seat seat;

  SeatRemoved({required this.seats, required this.seat});

  @override
  String toString() => 'SeatRemoved';
}
