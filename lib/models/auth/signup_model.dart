import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// packeges
import 'package:flutter_riverpod/flutter_riverpod.dart';
// router
import 'package:udemy_salon/constants/routes.dart' as routes;
// domain
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';

final signupProvider = ChangeNotifierProvider((ref) => SignupModel());

final emailErrorMessageProvider =
    StateProvider.autoDispose<String>((ref) => '');

final passwordErrorMessageProvider =
    StateProvider.autoDispose<String>((ref) => '');

class SignupModel extends ChangeNotifier {
  User? currentUser;

  // auth
  String email = "";
  String password = "";
  bool isObscure = true;

  Future<void> createFirestoreUser({
    required BuildContext context,
    required String uid,
  }) async {
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      uid: uid,
      userName: '',
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

  Future<void> createUser(
      {required BuildContext context, required WidgetRef ref}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      // バリデーションエラーのメッセージを削除
      ref.read(emailErrorMessageProvider.notifier).state = '';
      ref.read(passwordErrorMessageProvider.notifier).state = '';
      routes.toSalonRegisterPage(context: context);
    } on FirebaseAuthException catch (e) {
      String msg = '';
      String passMsg = '';
      final String errorCode = e.code;
      switch (errorCode) {
        case 'email-already-in-use':
          msg = 'すでに登録済みのメールアドレスです。';
          break;
        case 'operation-not-allowed':
          msg = '登録できませんでした';
          break;
        case 'invalid-email':
          msg = 'メールアドレスの形式が正しくありません。';
          break;
        case 'weak-password':
          passMsg = '推測され易いパスワードは使用できません。';
          break;
      }
      ref.read(emailErrorMessageProvider.notifier).state = msg;
      ref.read(passwordErrorMessageProvider.notifier).state = passMsg;
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
