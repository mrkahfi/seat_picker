// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      no: json['no'] as String,
      position: SeatPosition.fromJson(json['position'] as Map<String, dynamic>),
      deck: json['deck'] as String,
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'no': instance.no,
      'position': instance.position.toJson(),
      'deck': instance.deck,
    };
