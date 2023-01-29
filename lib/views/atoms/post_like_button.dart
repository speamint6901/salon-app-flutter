import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/posts/favarit_model.dart';

class PostLikeButton extends StatelessWidget {
  const PostLikeButton({
    Key? key,
    required this.mainModel,
    required this.post,
    required this.favoriteModel,
    required this.postDoc,
  }) : super(key: key);

  final MainModel mainModel;
  final Post post;
  final FavoriteModel favoriteModel;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;

  @override
  Widget build(BuildContext context) {
    return mainModel.likePostUids.contains(post.postId)
        ? InkWell(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () async => await favoriteModel.unlike(
                post: post,
                postRef: postDoc.reference,
                postDoc: postDoc,
                mainModel: mainModel),
          )
        : InkWell(
            child: Icon(Icons.favorite),
            onTap: () async => await favoriteModel.like(
                post: post,
                postRef: postDoc.reference,
                postDoc: postDoc,
                mainModel: mainModel),
          );
  }
}
