import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/comments/comment_list_model.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/posts/favarit_model.dart';
import 'package:udemy_salon/views/atoms/post_like_button.dart';
import 'package:udemy_salon/views/atoms/user_image.dart';

class PostTile extends ConsumerWidget {
  const PostTile({
    Key? key,
    required this.post,
    required this.mainModel,
    required this.favoriteModel,
    required this.postDoc,
  }) : super(key: key);

  final Post post;
  final MainModel mainModel;
  final FavoriteModel favoriteModel;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;

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
                userImageURL: post.imageURL,
                length: 32,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                post.text,
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PostLikeButton(
                mainModel: mainModel,
                post: post,
                favoriteModel: favoriteModel,
                postDoc: postDoc,
              ),
              // Icon(Icons.comment),
              InkWell(
                child: Icon(Icons.comment),
                onTap: () async => await commentListModel.init(
                  context: context,
                  post: post,
                  postDoc: postDoc,
                  mainModel: mainModel,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
