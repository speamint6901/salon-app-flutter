import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// packeges
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
// domain
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';

final signupProvider = ChangeNotifierProvider((ref) => SignupModel());

class SignupModel extends ChangeNotifier {
  User? currentUser = null;

  // auth
  String userName = "";
  String email = "";
  String password = "";
  bool isObscure = true;

  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    final Timestamp now = Timestamp.now();
    print(userName);
    final FirestoreUser firestoreUser = FirestoreUser(
      uid: uid,
      userName: userName,
      email: email,
      password: password,
      isAdmin: false,
      followerCount: 0,
      followingCount: 0,
      createdAt: now,
      updatedAt: now,
      userImageURL: '',
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    print(userData);
    await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
    print("ユーザーが作成出来ました。");
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      routes.toMyApp(context: context);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
