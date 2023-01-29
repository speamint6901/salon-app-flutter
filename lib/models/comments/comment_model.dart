// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/constants/voids.dart' as voids;
import 'package:udemy_salon/domain/comments/comment.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/models/main_model.dart';

final commentProvider = ChangeNotifierProvider(((ref) => CommentModel()));

class CommentModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String commentText = "";
  void showCommentFlashBar({
    required BuildContext context,
    required MainModel mainModel,
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) {
    const String titleString = "コメントを作成";
    voids.showFlashBar(
        context: context,
        mainModel: mainModel,
        textEditingController: textEditingController,
        onChanged: (value) => commentText,
        titleString: titleString,
        primaryActionColor: Colors.orange,
        primaryActionBuilder: (context, controller, _) {
          return InkWell(
            onTap: () async {
              if (textEditingController.text.isNotEmpty) {
                await createComment(
                  firestoreUser: mainModel.firestoreUser,
                  postDoc: postDoc,
                );
                await controller.dismiss();
                commentText = '';
              } else {
                await controller.dismiss();
              }
            },
            child: Icon(Icons.send),
          );
        });
  }

  Future<void> createComment({
    required FirestoreUser firestoreUser,
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) async {
    final Timestamp now = Timestamp.now();
    final String activeUid = firestoreUser.uid;
    final String postCommentId = returnUuidV4();
    final Comment comment = Comment(
      postCommentId: postCommentId,
      comment: commentText,
      userName: firestoreUser.userName,
      likeCount: 0,
      postCommentReplyCount: 0,
      userImageURL: '',
      uid: activeUid,
      createdAt: now,
      updatedAt: now,
    );
    await postDoc.reference
        .collection('postComments')
        .doc(postCommentId)
        .set(comment.toJson());
  }
}
