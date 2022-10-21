import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_salon/constants/others.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/following_token/following_token.dart';
import 'package:udemy_salon/models/main_model.dart';

import '../domain/firestore_user/firestore_user.dart';

final profileProvider = ChangeNotifierProvider((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  XFile? xFile = null;
  final ImagePicker _picker = ImagePicker();

  Future<String> uploadImageAndGetURL(
      {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    final Reference storerageRef = FirebaseStorage.instance
        .ref()
        .child("users")
        .child(uid)
        .child(fileName);
    // users/uid/ファイル名　にアップロード
    await storerageRef.putFile(file);
    // アップロード完了後、ダウンロードURLを取得
    return storerageRef.getDownloadURL();
  }

  Future<void> updateImageUserURL({
    required FirestoreUser firestoreUser,
  }) async {
    xFile = await returnXFile();
    final String uid = firestoreUser.uid;
    final File file = File(xFile!.path);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'userImageURL': url,
    });
    notifyListeners();
  }

  Future<void> follow({
    required MainModel mainModel,
    required FirestoreUser passiveFirestoreUser,
  }) async {
    final tokenId = returnUuidV4();
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    notifyListeners();
    final FollowingToken followingToken = FollowingToken(
      tokenId: tokenId,
      passiveUid: passiveFirestoreUser.uid,
      createdAt: Timestamp.now(),
    );
    final FirestoreUser activeUser = mainModel.firestoreUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection("tokens")
        .doc(tokenId)
        .set(followingToken.toJson());
  }

  Future<void> unFollow({
    required MainModel mainModel,
    required FirestoreUser passiveFirestoreUser,
  }) async {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    notifyListeners();
    // followしているtokensを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
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
  }
}
