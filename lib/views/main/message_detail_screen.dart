import 'package:flutter/material.dart';
import 'package:udemy_salon/Molecules/message_input_field.dart';
import 'package:udemy_salon/Organisms/message_body.dart';
import 'package:udemy_salon/constants/doubles.dart';
import 'package:udemy_salon/models/message_chat_model.dart';

class MessageDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: demeMessageChatModels.length,
              itemBuilder: (context, index) =>
                  MessageBody(message: demeMessageChatModels[index]),
            ),
          ),
          MessageInputField(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/IMG_4831.JPG'),
          ),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '皐月',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Active 3m ago',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
