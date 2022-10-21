import 'package:flutter/material.dart';
import 'package:udemy_salon/atoms/circle_image.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.userImageURL,
    required this.length,
  }) : super(key: key);
  final String userImageURL;
  final double length;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: userImageURL.isEmpty
          ? Container(
              width: length,
              height: length,
              child: Icon(Icons.person, size: length),
            )
          : CircleImage(
              length: length,
              height: length,
              image: NetworkImage(userImageURL)),
    );
  }
}
