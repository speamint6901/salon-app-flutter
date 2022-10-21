import 'package:flutter/material.dart';
import 'package:udemy_salon/Organisms/message_card.dart';
import 'package:udemy_salon/constants/routes.dart';
import 'package:udemy_salon/models/message_model.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesData.length,
              itemBuilder: (context, index) => MessageCard(
                message: messagesData[index],
                press: () => toMessageDetail(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('メッセージ'),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
