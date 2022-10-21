// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/like_post_token/like_post_token.dart';
import 'package:udemy_salon/domain/post/post.dart';

final favoriteProvider = ChangeNotifierProvider(((ref) => FavoriteModel()));

class FavoriteModel extends ChangeNotifier {
  late final DocumentSnapshot<Map<String, dynamic>> currentUser;
  Future<void> like(
      {required Post post,
      required DocumentReference<Map<String, dynamic>> postRef}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final LikePostToken likePostToken = LikePostToken(
      tokenId: tokenId,
      activeUid: currentUser!.uid,
      passiveUid: post.uid,
      postRef: postRef,
      postId: post.postId,
      createdAt: now,
    );
    notifyListeners();
  }

  Future<void> unlike() async {}
}
