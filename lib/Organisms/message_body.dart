import 'package:flutter/material.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/constants/doubles.dart';
import 'package:udemy_salon/models/message_chat_model.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    Key? key,
    required this.message,
  }) : super(key: key);
  final MessageChatModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/IMG_4807.JPG'),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            )
          ],
          Container(
            // margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 0.75,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isSender
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
