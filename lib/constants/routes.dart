import 'package:flutter/material.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/main.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/views/account_page.dart';
import 'package:udemy_salon/views/admin/admin_page.dart';
import 'package:udemy_salon/views/login_page.dart';
import 'package:udemy_salon/views/main/message_detail_screen.dart';
import 'package:udemy_salon/views/main/passive_user_profile.dart';
import 'package:udemy_salon/views/signup_page.dart';

void toMyApp({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => const MyApp()));
void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => const SignupPage()));
void toLoginPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
void toAccountPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountPage(
          mainModel: mainModel,
        ),
      ),
    );
void toPassiveUserProfile({
  required BuildContext context,
  required FirestoreUser passiveUser,
  required MainModel mainModel,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PassiveUserProfile(
          passiveUser: passiveUser,
          mainModel: mainModel,
        ),
      ),
    );
void toMessageDetail({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => MessageDetailScreen()));

void toAdminPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => AdminPage()));
