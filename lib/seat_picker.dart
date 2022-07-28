import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_picker/src/bloc/seat/seat_bloc.dart';
import 'package:seat_picker/models/seat.dart';
import 'package:seat_picker/models/seat_position.dart';
import 'package:seat_picker/utils/ui_utils.dart';

typedef SeatListsChanged = void Function(List<Seat> seats, Seat seat);

class SeatPicker extends StatelessWidget {
  static const MethodChannel _channel = MethodChannel('seat_picker');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  final List<Seat> allSeats;
  final List<Seat>? selectedSeats;
  final List<Seat> bookedSeats;
  final String seatLayout;
  final String bookedSeatAsset;
  final String selectedSeatAsset;
  final String freeSeatAsset;
  final SeatListsChanged onSeatSelected;

  const SeatPicker(
      {Key? key,
      required this.allSeats,
      this.selectedSeats,
      required this.bookedSeats,
      required this.seatLayout,
      required this.onSeatSelected,
      required this.bookedSeatAsset,
      required this.selectedSeatAsset,
      required this.freeSeatAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    SeatBloc seatBloc = SeatBloc(SeatInitial());

    seatBloc.add(SetSeats(seats: selectedSeats ?? []));
    return BlocProvider<SeatBloc>(
      create: (context) => seatBloc,
      child: BlocBuilder<SeatBloc, SeatState>(
        builder: (context, state) {
          print('seat state $state');
          List<Seat> selectedSeats = [];
          if (state is SeatInitial) {
          } else if (state is SeatsSeat) {
            selectedSeats = state.seats;
          } else if (state is SeatAdded) {
            selectedSeats = state.seats;
          } else if (state is SeatRemoved) {
            selectedSeats = state.seats;
          }

          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  _buildCells(context, allSeats, selectedSeats, bookedSeats));
        },
      ),
    );
  }

  List<Row> _buildCells(BuildContext context, List<Seat> allSeats,
      List<Seat> selectedSeats, List<Seat> bookedSeats) {
    double cellHeight = UiUtils.computeCellHeight(context, allSeats);
    double cellWidth = UiUtils.computeCellWidth(context, seatLayout);

    int rowCount = allSeats.last.position.row;
    List<Row> rows = List.generate(rowCount, (rowIndex) {
      List<Seat> seats =
          allSeats.where((seat) => seat.position.row == rowIndex + 1).toList();
      List<Widget> column =
          List.generate(seats.last.position.column, (columnIndex) {
        int pos =
            seats.indexWhere((seat) => seat.position.column == columnIndex + 1);
        if (pos != -1) {
          Seat seat = seats[pos];
          bool booked =
              bookedSeats.indexWhere((element) => element.no == seat.no) >= 0;
          bool selected =
              selectedSeats.indexWhere((element) => element.no == seat.no) >= 0;

          Image image = Image.asset(
            booked
                ? bookedSeatAsset
                : (selected ? selectedSeatAsset : freeSeatAsset),
          );

          var item = InkWell(
            onTap: booked
                ? null
                : () {
                    if (!selected) {
                      _addSeatToCallbackSeats(selectedSeats, seat);
                      BlocProvider.of<SeatBloc>(context)
                          .add(AddSeat(seat: seat));
                    } else {
                      _removeSeatFromCallbackSeats(selectedSeats, seat);
                      BlocProvider.of<SeatBloc>(context)
                          .add(RemoveSeat(seat: seat));
                    }
                  },
            child: Container(
              width: cellWidth,
              height: cellHeight,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Stack(
                children: [
                  Center(child: image),
                  Center(
                    child: Text(
                      seat.no,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
          return item;
        } else {
          return Container(
            width: cellWidth,
            height: cellHeight,
            padding: const EdgeInsets.symmetric(vertical: 2),
          );
        }
      });
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: column,
      );
    });

    return rows;
  }

  static List<Seat> loadSeats() {
    List<Seat> seats = [];
    for (int i = 1; i <= 11; i++) {
      if (i < 8 || i >= 10) {
        Seat seat1 = Seat(
            no: 'A$i',
            position: SeatPosition(row: i, column: 1),
            deck: 'bottom');
        seats.add(seat1);
        Seat seat2 = Seat(
            no: 'B$i',
            position: SeatPosition(row: i, column: 2),
            deck: 'bottom');
        seats.add(seat2);
      }

      if (i <= 10) {
        Seat seat3 = Seat(
            no: 'C$i',
            position: SeatPosition(row: i, column: 4),
            deck: 'bottom');
        seats.add(seat3);
        Seat seat4 = Seat(
            no: 'D$i',
            position: SeatPosition(row: i, column: 5),
            deck: 'bottom');
        seats.add(seat4);
      } else {
        Seat seat3 = Seat(
            no: 'C$i',
            position: SeatPosition(row: i, column: 3),
            deck: 'bottom');
        seats.add(seat3);
        Seat seat4 = Seat(
            no: 'D$i',
            position: SeatPosition(row: i, column: 4),
            deck: 'bottom');
        seats.add(seat4);
        Seat seat5 = Seat(
            no: 'E$i',
            position: SeatPosition(row: i, column: 5),
            deck: 'bottom');
        seats.add(seat5);
      }
    }
    return seats;
  }

  void _addSeatToCallbackSeats(selectedSeats, seat) {
    List<Seat> seats = List.from(selectedSeats
        .map((e) => e.copyWith(no: e.no, deck: e.deck, position: e.position))
        .toList());
    seats.add(seat);
    onSeatSelected(seats, seat);
  }

  void _removeSeatFromCallbackSeats(selectedSeats, seat) {
    List<Seat> seats = List.from(selectedSeats
        .map((e) => e.copyWith(no: e.no, deck: e.deck, position: e.position))
        .toList());
    seats.removeWhere((element) => element == seat);
    onSeatSelected(seats, seat);
  }
}
