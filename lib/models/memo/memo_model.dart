// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/memo/memo.dart';

final memoProvider = ChangeNotifierProvider(((ref) => MemoModel()));

class MemoModel extends ChangeNotifier {
  List<Memo> memos = [];
  Future<void> create() async {
    final DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc('Ta9v3rXA07TAdOqL1mN2FDsKnoz2');
    Memo memo = Memo(
      title: "テスト",
      detail: "買い出し",
      user: userRef,
      createdAt: Timestamp.now(),
    );
    await FirebaseFirestore.instance
        .collection('memo')
        .doc('832pD7suTw3Vv2BSEy5z')
        .set(memo.toJson());
  }

  Future<void> getMemoList() async {
    final QuerySnapshot<Map<String, dynamic>> qshot =
        await FirebaseFirestore.instance.collection('memo').get();
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;

    // List<Memo> tmpMemos = [];
    // for (var doc in docs) {
    //   dynamic user;
    //   if (doc['user'] != null) {
    //     var shot = await doc['user'].get();
    //     user = shot.data();
    //   }
    //   Memo fetchMemo = Memo(
    //     title: doc['title'],
    //     detail: doc['detail'],
    //     createdAt: doc['createdAt'],
    //     user: user,
    //   );
    //   tmpMemos.add(fetchMemo);
    // }
    // memos = tmpMemos;
    memos = docs.map((e) => Memo.fromJson(e.data()!)).toList();
  }
}
