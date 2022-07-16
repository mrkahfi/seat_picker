import 'package:seat_picker/models/seat_position.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';

@JsonSerializable(explicitToJson: true)
class Seat {
  final String no;
  final SeatPosition position;
  final String deck; // 'bottom' or 'top'

  Seat({required this.no, required this.position, required this.deck});

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);

  Seat copyWith({String? no, SeatPosition? position, String? deck}) {
    return Seat(
        no: no ?? this.no,
        position: position ?? this.position,
        deck: deck ?? this.deck);
  }

  @override
  String toString() => 'Seat(no: $no, position: $position, deck: $deck)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Seat &&
        (other.no == no &&
            other.position.row == position.row &&
            other.position.column == position.column &&
            other.deck == deck);
  }

  @override
  int get hashCode => no.hashCode ^ position.hashCode ^ deck.hashCode;
}
