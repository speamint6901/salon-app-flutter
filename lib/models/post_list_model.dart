// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final postListProvider = ChangeNotifierProvider(((ref) => PostListModel()));

class PostListModel extends ChangeNotifier {
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
  bool isLoading = false;
  late User? currentUser;
  final RefreshController refreshController = RefreshController();

  PostListModel() {
    init();
  }

  Query<Map<String, dynamic>> returnQuery() {
    currentUser = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('posts')
        .limit(30)
        .orderBy('createdAt', descending: true);
  }

  Future<void> init() async {
    startLoading();
    final query = returnQuery();
    final qshot = await query.get();
    postDocs = qshot.docs;
    notifyListeners();
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

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery().endBeforeDocument(postDocs.first).get();
      final reversed = qshot.docs.reversed.toList();
      for (final postDoc in reversed) {
        postDocs.insert(0, postDoc);
      }
    }
    notifyListeners();
  }

  Future<void> onReload() async {
    startLoading();
    final qshot = await returnQuery().get();
    postDocs = qshot.docs;
    endLoading();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery().startAfterDocument(postDocs.last).get();
      for (final postDoc in qshot.docs) {
        postDocs.add(postDoc);
      }
      postDocs = qshot.docs;
    }
    notifyListeners();
  }
}
