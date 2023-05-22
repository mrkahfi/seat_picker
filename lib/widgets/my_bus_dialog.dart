import 'package:flutter/material.dart';
import 'package:seat_picker/widgets/my_bus_button.dart';

class MyBusDialogHorizontal extends StatelessWidget {
  final String title;
  final String description;
  final String positiveButtonText;
  final VoidCallback positiveButtonCallback;
  final String negativeButtonText;
  final VoidCallback negativeButtonCallback;
  final bool isErrorDialog;
  final Widget? extraContent;
  final String? asset;

  const MyBusDialogHorizontal({
    super.key,
    required this.title,
    required this.description,
    this.positiveButtonText = 'OK',
    required this.positiveButtonCallback,
    this.negativeButtonText = 'CANCEL',
    required this.negativeButtonCallback,
    this.isErrorDialog = false,
    this.extraContent,
    this.asset,
  });

  List<Widget> _renderButton() {
    List<Widget> widgets = [];

    if (!isErrorDialog) {
      widgets.add(
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyBusButtonSecondary(
              negativeButtonText,
              onPressed: negativeButtonCallback,
            ),
          ),
        ),
      );
    }

    widgets.add(
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: MyBusButton(
            positiveButtonText,
            onPressed: positiveButtonCallback,
          ),
        ),
      ),
    );

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (asset != null)
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      asset!,
                      width: 200,
                      height: 200,
                    )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20),
                  )),
              Container(
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
              if (extraContent != null)
                Container(
                  margin:
                      const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: extraContent,
                ),
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _renderButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
