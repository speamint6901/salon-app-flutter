// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/main_model.dart';

final commentListProvider =
    ChangeNotifierProvider(((ref) => CommentListModel()));

class CommentListModel extends ChangeNotifier {
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
  bool isLoading = false;
  final RefreshController refreshController = RefreshController();
  List<DocumentSnapshot<Map<String, dynamic>>> commentDocs = [];

  Query<Map<String, dynamic>> returnQuery({
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) {
    return postDoc.reference
        .collection('postComments')
        .orderBy("likeCount", descending: true);
  }

  Future<void> init({
    required BuildContext context,
    required Post post,
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
    required MainModel mainModel,
  }) async {
    startLoading();
    // final query = returnQuery();
    // final qshot = await query.get();
    // postDocs = qshot.docs;
    // notifyListeners();
    routes.toCommentPage(context: context, post: post, postDoc: postDoc);
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> onRefresh(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    refreshController.refreshCompleted();
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery(postDoc: postDoc)
          .endBeforeDocument(postDocs.first)
          .get();
      final reversed = qshot.docs.reversed.toList();
      for (final postDoc in reversed) {
        postDocs.insert(0, postDoc);
      }
    }
    notifyListeners();
  }

  //
  Future<void> onReload({
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) async {
    startLoading();
    final qshot = await returnQuery(postDoc: postDoc).get();
    postDocs = qshot.docs;
    endLoading();
  }

  //
  Future<void> onLoading({
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) async {
    refreshController.loadComplete();
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery(postDoc: postDoc)
          .startAfterDocument(postDocs.last)
          .get();
      for (final postDoc in qshot.docs) {
        postDocs.add(postDoc);
      }
      postDocs = qshot.docs;
    }
    notifyListeners();
  }
}
