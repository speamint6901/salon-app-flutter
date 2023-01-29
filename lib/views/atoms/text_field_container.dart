// flutter
import 'package:flutter/material.dart';
// packages

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {super.key,
      required this.color,
      required this.borderColor,
      required this.shadowColor,
      required this.child});
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // スマホ(デバイス)のサイズ取得
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Center(
      child: Container(
        // symmetric = 対称
        // vertical = 上下
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: width * 0.9,
        // decoration: BoxDecoration(
        //     // all() = 全方向に線がつく
        //     border: Border.all(
        //       color: borderColor,
        //     ),
        //     color: color,
        //     borderRadius: BorderRadius.circular(16.0),
        //     boxShadow: [BoxShadow(color: shadowColor, blurRadius: 8.0)]),
      ),
    );
  }
}
