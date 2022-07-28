import 'package:flutter/material.dart';

class MyBusButton extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final double fontSize;

  const MyBusButton(
    this.text, {
    Key? key,
    this.height = 42,
    this.onPressed,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: onPressed != null ? Colors.blue : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 40, height)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}

class MyBusButtonSecondary extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final double fontSize;

  const MyBusButtonSecondary(
    this.text, {
    Key? key,
    this.height = 42,
    this.onPressed,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
          color:
              onPressed != null ? Colors.white : Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: onPressed != null
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5))),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 40, height)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}
