import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/comments/comment.dart';
import 'package:udemy_salon/models/comments/comment_list_model.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/views/atoms/user_image.dart';

class CommentTile extends ConsumerWidget {
  const CommentTile({
    Key? key,
    required this.comment,
    required this.mainModel,
    required this.commentListDoc,
  }) : super(key: key);

  final Comment comment;
  final MainModel mainModel;
  final DocumentSnapshot<Map<String, dynamic>> commentListDoc;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final CommentListModel commentListModel = ref.watch(commentListProvider);
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserImage(
                userImageURL: comment.userImageURL,
                length: 32,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                comment.comment,
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
