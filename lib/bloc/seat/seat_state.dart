part of 'seat_bloc.dart';

@immutable
abstract class SeatState {}

class SeatInitial extends SeatState {
  SeatInitial();
}

class SeatAdded extends SeatState {
  final List<Seat> seats;
  SeatAdded({required this.seats});

  @override
  String toString() => 'SeatAdded';
}

class SeatRemoved extends SeatState {
  final List<Seat> seats;

  SeatRemoved({required this.seats});

  @override
  String toString() => 'SeatRemoved';
}
