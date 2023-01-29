import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// packeges
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/enums.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/domain/following_token/following_token.dart';
import 'package:udemy_salon/domain/like_post_token/like_post_token.dart';
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/repositories/salons/salon_repo.dart';

import '../domain/firestore_user/firestore_user.dart';

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  bool isLoading = false;
  User? currentUser = null;
  Salon? currentSalon = null;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  late DocumentReference currentSalonDoc;
  late FirestoreUser firestoreUser;
  List<FollowingToken> followingTokens = [];
  List<String> followingUids = [];
  List<LikePostToken> likePostTokens = [];
  List<String> likePostUids = [];
  // コンストラクタ
  MainModel() {
    init();
  }
  Future<void> init() async {
    startLoading();
    currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
    currentUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
    await distributeTokens();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    // salons情報取得
    currentSalonDoc = await SalonRepo().hasSalonData(uid: firestoreUser.uid);
    final doc = await currentSalonDoc.get();
    if (doc.exists) {
      currentSalon = Salon.fromJson(doc.data() as Map<String, dynamic>);
    }
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

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> distributeTokens() async {
    final tokenQshot =
        await currentUserDoc.reference.collection('tokens').get();
    final tokenDocs = tokenQshot.docs;
    for (final token in tokenDocs) {
      final Map<String, dynamic> tokenMap = token.data();
      // StringからEnumに変換してミスが無いようにしたい
      final TokenType tokenType = mapToTokenType(tokenMap: tokenMap);
      switch (tokenType) {
        case TokenType.following:
          final FollowingToken followingToken =
              FollowingToken.fromJson(tokenMap);
          followingTokens.add(followingToken);
          followingUids.add(followingToken.passiveUid);
          break;
        case TokenType.likePost:
          final LikePostToken likePostToken = LikePostToken.fromJson(tokenMap);
          likePostTokens.add(likePostToken);
          likePostUids.add(likePostToken.postId);
          break;
      }
    }
  }

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context, mainModel: mainModel);
  }
}
