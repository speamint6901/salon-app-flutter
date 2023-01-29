// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/domain/follower/follower.dart';
import 'package:udemy_salon/domain/following_token/following_token.dart';
import 'package:udemy_salon/models/main_model.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider(((ref) => PassiveUserProfileModel()));

class PassiveUserProfileModel extends ChangeNotifier {
  Future<void> follow({
    required MainModel mainModel,
    required FirestoreUser passiveFirestoreUser,
  }) async {
    final tokenId = returnUuidV4();
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    final timeStampNow = Timestamp.now();
    // 自分がフォローした印
    final FollowingToken followingToken = FollowingToken(
      tokenId: tokenId,
      passiveUid: passiveFirestoreUser.uid,
      createdAt: timeStampNow,
      tokenType: "following",
    );
    final FirestoreUser activeUser = mainModel.firestoreUser;
    print(activeUser);
    final newActiveUser = activeUser.copyWith(
        followingCount: passiveFirestoreUser.followerCount + 1);
    mainModel.firestoreUser = newActiveUser;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection("tokens")
        .doc(tokenId)
        .set(followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final Follower follower = Follower(
        followedUid: passiveFirestoreUser.uid,
        followerUid: activeUser.uid,
        createdAt: timeStampNow);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveFirestoreUser.uid)
        .collection('followers')
        .doc(activeUser.uid)
        .set(follower.toJson());
  }

  Future<void> unFollow({
    required MainModel mainModel,
    required FirestoreUser passiveFirestoreUser,
  }) async {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    // followしているtokensを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final newActiveUser = activeUser.copyWith(
        followingCount: passiveFirestoreUser.followerCount - 1);
    mainModel.firestoreUser = newActiveUser;
    notifyListeners();
    final qshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .where('passiveUid', isEqualTo: passiveFirestoreUser.uid)
        .get();
    print(qshot);
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    await token.reference.delete();
    // 受動的なユーザーがフォローされたdataを削除する
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveFirestoreUser.uid)
        .collection('followers')
        .doc(activeUser.uid)
        .delete();
  }
}
