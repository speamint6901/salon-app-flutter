// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';

final adminProvider = ChangeNotifierProvider(((ref) => AdminModel()));

class AdminModel extends ChangeNotifier {
  Future<void> admin({
    required FirestoreUser firestoreUser,
    required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
  }) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    final QuerySnapshot<Map<String, dynamic>> usersQshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (final user in usersQshot.docs) {
      batch.update(user.reference, {
        "email": FieldValue.delete(),
      });
    }
    // postにユーザー名を追加
    final postsQshot = await currentUserDoc.reference.collection('posts').get();
    for (final post in postsQshot.docs) {
      batch.update(post.reference, {"userName": firestoreUser.userName});
      batch
          .update(post.reference, {"userImageURL": firestoreUser.userImageURL});
    }
    batch.commit();
  }
}
