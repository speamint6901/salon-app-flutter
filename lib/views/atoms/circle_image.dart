import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.length,
    required this.height,
    required this.image,
  }) : super(key: key);
  final double length;
  final double height;
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.cover, image: image)),
    );
  }
}
