// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/rooms/room.dart';
import 'package:udemy_salon/models/main_model.dart';

final createRoomProvider = ChangeNotifierProvider(((ref) => CreateRoomModel()));

class CreateRoomModel extends ChangeNotifier {
  Future<void> createRoom({
    required BuildContext context,
    required String attendUid,
    required MainModel mainModel,
  }) async {
    final Timestamp now = Timestamp.now();
    final activeUid = mainModel.currentUserDoc.id;

    final QuerySnapshot roomQshot = await FirebaseFirestore.instance
        .collection('rooms')
        .where('usersQuery.$activeUid', isEqualTo: true)
        .get();
    if (roomQshot.docs.isEmpty) {
      final roomId = returnUuidV4();
      final Room room = Room(
        roomId: roomId,
        lastMessage: "",
        lastSenderUid: "",
        joinedUsers: [activeUid, attendUid],
        usersQuery: {activeUid: true, attendUid: false},
        createdAt: now,
      );
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .set(room.toJson());
    }
    routes.toMessageDetail(context: context);
  }
}
