import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    super.key,
    required this.onPressed,
    required this.widthRate,
    required this.color,
    required this.labelText,
    required this.textSize,
    this.height,
  });
  final void Function()? onPressed;
  // 0 < widthRate < 1.0
  final double widthRate;
  final Color color;
  final String labelText;
  final double textSize;
  final double? height;

  double currentHeight = 50;

  @override
  Widget build(BuildContext context) {
    if (height != null) {
      currentHeight = height!;
    }
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth * widthRate,
      height: currentHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              child: Text(
                labelText,
                style: TextStyle(fontSize: textSize),
              ),
            )),
      ),
    );
  }
}
