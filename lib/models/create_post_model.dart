// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/main_model.dart';

final CreatePostProvider = ChangeNotifierProvider(((ref) => CreatePostModel()));

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = "";
  void showPostFlashDialog(
      {required BuildContext context, required MainModel mainModel}) {
    context.showFlashBar(
      persistent: true,
      content: Form(
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) => text = value,
          maxLength: 10,
        ),
      ),
      title: Text('投稿を作成する'),
      primaryActionBuilder: (context, controller, _) {
        return InkWell(
          onTap: () async {
            if (textEditingController.text.isNotEmpty) {
              await createPost(currentUserDoc: mainModel.currentUserDoc);
              await controller.dismiss();
              text = '';
            } else {
              await controller.dismiss();
            }
          },
          child: Icon(Icons.send),
        );
      },
      // 閉じる時の動作
      negativeActionBuilder: (context, controller, _) {
        return InkWell(
          child: Icon(Icons.close),
          onTap: () async => await controller.dismiss(),
        );
      },
    );
  }

  Future<void> createPost(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final postId = returnUuidV4();
    final Post post = Post(
      postId: postId,
      likeCount: 0,
      uid: activeUid,
      text: text,
      imageURL: "",
      hashTags: [],
      createdAt: now,
      updatedAt: now,
    );
    // await FirebaseFirestore.instance.collection('users').doc(firestoreUser.uid).collection('posts').doc(postId).set(post.toJson());と同義
    await currentUserDoc.reference
        .collection('posts')
        .doc(postId)
        .set(post.toJson());
  }
}
