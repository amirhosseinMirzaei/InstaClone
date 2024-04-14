import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  final String text;
  final GestureTapCallback callback;
  const PinkButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF37381),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
