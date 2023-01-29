import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_salon/constants/doubles.dart';
import 'package:udemy_salon/views/atoms/user_image.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.room,
    required this.press,
  }) : super(key: key);
  final dynamic room;
  final VoidCallback press;

  @override
  Widget build(BuildContext contexttime) {
    print(room);
    var timeFormat = DateFormat('HH:mm');
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                UserImage(userImageURL: room['userImageURL'], length: 24.0)
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room['userName'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        room['lastMessage'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Opacity(
                opacity: 0.64,
                child: room['updatedAt'].toString() != null
                    ? Text(
                        timeFormat
                            .format(room['updatedAt'].toDate())
                            .toString(),
                      )
                    : Spacer())
          ],
        ),
      ),
    );
  }
}
