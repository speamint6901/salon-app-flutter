// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/atoms/rounded_button.dart';
import 'package:udemy_salon/atoms/user_image.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/passive_user_profile_model.dart';

class PassiveUserProfile extends ConsumerWidget {
  const PassiveUserProfile({
    super.key,
    required this.passiveUser,
    required this.mainModel,
  });
  final FirestoreUser passiveUser;
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final int followerCount = passiveUser.followerCount;
    final int plusOneFollowerCount = passiveUser.followerCount + 1;
    final bool isFollowing = mainModel.followingUids.contains(passiveUser.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserImage(userImageURL: passiveUser.userImageURL, length: 100.0),
          Center(
            child: Text(passiveUser.userName),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "フォロー中" + passiveUser.followingCount.toString(),
              style: TextStyle(fontSize: 32.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
                isFollowing
                    ? "フォロワー" + plusOneFollowerCount.toString()
                    : "フォロワー" + followerCount.toString(),
                style: TextStyle(fontSize: 32.0)),
          ),
          isFollowing
              ? RoundedButton(
                  onPressed: () => passiveUserProfileModel.unFollow(
                      mainModel: mainModel, passiveFirestoreUser: passiveUser),
                  widthRate: 0.8,
                  color: Colors.green,
                  labelText: "フォローを外す",
                )
              : RoundedButton(
                  onPressed: () async => passiveUserProfileModel.follow(
                      mainModel: mainModel, passiveFirestoreUser: passiveUser),
                  widthRate: 0.8,
                  color: Colors.green,
                  labelText: "フォローする",
                )
        ],
      ),
    );
  }
}
