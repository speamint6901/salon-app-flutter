import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/constants/routes.dart';
import 'package:udemy_salon/models/rooms/room_model.dart';
import 'package:udemy_salon/views/organisms/message_card.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Color(0x75E4E4E8),
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: roomModel.rooms.length,
              itemBuilder: (context, index) => MessageCard(
                room: roomModel.rooms[index],
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
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'メッセージ',
        style: TextStyle(color: kPrimaryColor),
      ),
    );
  }
}
