// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomProvider = ChangeNotifierProvider(((ref) => RoomModel()));

class RoomModel extends ChangeNotifier {
  // late RoomModel roomModel;
  bool isLoading = false;
  late User? currentUser;
  late List<dynamic> rooms;

  RoomModel() {
    init();
  }

  Future<void> init() async {
    startLoading();
    currentUser = FirebaseAuth.instance.currentUser;
    final roomSshot = await FirebaseFirestore.instance
        .collection('rooms')
        .where('joinedUsers', arrayContains: currentUser?.uid)
        .orderBy('updatedAt', descending: true)
        .limit(10)
        .get();
    final roomDocs = roomSshot.docs;
    rooms = [];
    for (final roomDoc in roomDocs) {
      final tmpData = roomDoc.data();
      final String atendUid =
          tmpData['joinedUsers'].firstWhere((e) => e != currentUser?.uid);
      final userDocShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(atendUid)
          .get();
      tmpData['userName'] = userDocShot.data()?['userName'];
      tmpData['userImageURL'] = userDocShot.data()?['userImageURL'];
      rooms.add(tmpData);
    }
    endLoading();
  }

  Future<Stream<QuerySnapshot>> getRoomsQueryShot() async {
    return FirebaseFirestore.instance
        .collection('rooms')
        .where('joinedUsers', arrayContains: currentUser?.uid)
        .orderBy('updatedAt', descending: true)
        .limit(10)
        .snapshots();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }
}

class Message {
  final String name, lastMessage, image, time;
  final bool isActive;

  Message({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List messagesData = [
  Message(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/IMG_4831.JPG",
    time: "3m ago",
    isActive: false,
  ),
  Message(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/IMG_4807.JPG",
    time: "8m ago",
    isActive: true,
  ),
  Message(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/IMG_4808.JPG",
    time: "5d ago",
    isActive: false,
  ),
  Message(
    name: "皐月",
    lastMessage: "You’re welcome :)",
    image: "assets/images/IMG_4809.JPG",
    time: "5d ago",
    isActive: true,
  ),
  // Message(
  //   name: "Albert Flores",
  //   lastMessage: "Thanks",
  //   image: "assets/images/user_5.png",
  //   time: "6d ago",
  //   isActive: false,
  // ),
  // Message(
  //   name: "Jenny Wilson",
  //   lastMessage: "Hope you are doing well...",
  //   image: "assets/images/user.png",
  //   time: "3m ago",
  //   isActive: false,
  // ),
  // Message(
  //   name: "Esther Howard",
  //   lastMessage: "Hello Abdullah! I am...",
  //   image: "assets/images/user_2.png",
  //   time: "8m ago",
  //   isActive: true,
  // ),
  // Message(
  //   name: "Ralph Edwards",
  //   lastMessage: "Do you have update...",
  //   image: "assets/images/user_3.png",
  //   time: "5d ago",
  //   isActive: false,
  // ),
];
