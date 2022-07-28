import 'package:flutter/material.dart';
import 'package:seat_picker/widgets/my_bus_button.dart';

class MyBusEmptyMessage extends StatelessWidget {
  final Widget icon;
  final String message;

  final VoidCallback onPressed;

  const MyBusEmptyMessage(
      {Key? key,
      required this.icon,
      required this.message,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Text(
          message,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: MyBusButton(
            'Tambah',
            onPressed: onPressed,
          ),
        )
      ],
    ));
  }
}
