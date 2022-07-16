part of 'seat_bloc.dart';

@immutable
abstract class SeatEvent extends Equatable {
  const SeatEvent([List props = const []]);
}

class AddSeat extends SeatEvent {
  final Seat seat;

  const AddSeat({required this.seat});

  @override
  String toString() => 'AddSeat';

  @override
  List<Object> get props => [];
}

class SetSeats extends SeatEvent {
  final List<Seat> seats;

  const SetSeats({required this.seats});

  @override
  String toString() => 'SetSeats';

  @override
// TODO: implement props
  List<Object> get props => [seats];
}

class RemoveSeat extends SeatEvent {
  final Seat seat;

  const RemoveSeat({required this.seat});

  @override
  String toString() => 'RemoveSeat';

  @override
  List<Object> get props => [];
}
