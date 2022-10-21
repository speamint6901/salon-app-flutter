import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/atoms/rounded_button.dart';
import 'package:udemy_salon/atoms/user_image.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/profile_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserImage(
          userImageURL: mainModel.firestoreUser.userImageURL,
          length: 100.0,
        ),
        RoundedButton(
          onPressed: () async => await profileModel.updateImageUserURL(
            firestoreUser: mainModel.firestoreUser,
          ),
          widthRate: 0.8,
          color: Colors.green,
          labelText: "アップロード",
        ),
        SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
