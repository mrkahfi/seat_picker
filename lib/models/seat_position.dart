import 'package:json_annotation/json_annotation.dart';

part 'seat_position.g.dart';

@JsonSerializable()
class SeatPosition {
  final int row;
  final int column;

  SeatPosition({required this.row, required this.column});

  factory SeatPosition.fromJson(Map<String, dynamic> json) =>
      _$SeatPositionFromJson(json);

  Map<String, dynamic> toJson() => _$SeatPositionToJson(this);
}