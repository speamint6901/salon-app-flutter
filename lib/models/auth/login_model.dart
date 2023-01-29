// flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/repositories/salons/salon_repo.dart';

final loginProvider = ChangeNotifierProvider(((ref) => LoginModel()));

class LoginModel extends ChangeNotifier {
  User? currentUser = null;
  String email = "";
  String password = "";
  bool isObscure = true;

  Future<void> login({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      // サロン未登録の場合はサロン登録ページへリダイレクトする処理
      final salonDshot = await SalonRepo().hasSalonData(uid: user!.uid);

      salonDshot.get().then((value) => {
            value.exists
                ? routes.toMyApp(context: context)
                : routes.toSalonRegisterPage(context: context)
          });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
