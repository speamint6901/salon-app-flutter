// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/domain/like_post_token/like_post_token.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/domain/post_like/post_like.dart';
import 'package:udemy_salon/models/main_model.dart';

final favoriteProvider = ChangeNotifierProvider(((ref) => FavoriteModel()));

class FavoriteModel extends ChangeNotifier {
  late final DocumentSnapshot<Map<String, dynamic>> currentUser;
  Future<void> like({
    required Post post,
    required DocumentReference<Map<String, dynamic>> postRef,
    required DocumentSnapshot postDoc,
    required MainModel mainModel,
  }) async {
    final String postId = post.postId;
    mainModel.likePostUids.add(postId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String passiveUid = post.uid;
    notifyListeners();
    // 自分がイイねした事の印
    final LikePostToken likePostToken = LikePostToken(
        tokenId: tokenId,
        activeUid: activeUid,
        passiveUid: passiveUid,
        postRef: postRef,
        postId: postId,
        createdAt: now,
        tokenType: "likePost");
    currentUserDoc.reference
        .collection('tokens')
        .doc(tokenId)
        .set(likePostToken.toJson());

    // 自分がイイねされた事の印
    final PostLike postLike = PostLike(
      activeUid: activeUid,
      createdAt: now,
      postCreatorUid: passiveUid,
      postRef: postRef,
      postId: postId,
    );
    // イイねした人が重複しないようにUidをdocumentIdとする
    await postDoc.reference
        .collection("postLikes")
        .doc(activeUid)
        .set(postLike.toJson());
  }

  Future<void> unlike({
    required Post post,
    required DocumentReference<Map<String, dynamic>> postRef,
    required DocumentSnapshot postDoc,
    required MainModel mainModel,
  }) async {
    final String postId = post.postId;
    mainModel.likePostUids.remove(postId);
    final currentUserDoc = mainModel.currentUserDoc;
    final activeUid = currentUserDoc.id;
    notifyListeners();
    // 自分がイイねした印を削除
    // qshotというdataの塊の存在を取得
    final QuerySnapshot<Map<String, dynamic>> qshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(activeUid)
        .collection('tokens')
        .where("postId", isEqualTo: postId)
        .get();
    // 一個しか取得してないが、リスト扱い
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    await token.reference.delete();
    // イイねされた事の印の削除
    print(activeUid);
    await postDoc.reference.collection("postLikes").doc(activeUid).delete();
  }
}
