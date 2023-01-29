import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/main.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/views/admin/admin_page.dart';
import 'package:udemy_salon/views/auth/account_page.dart';
import 'package:udemy_salon/views/auth/login_page.dart';
import 'package:udemy_salon/views/auth/salon_register_page.dart';
import 'package:udemy_salon/views/auth/signup_page.dart';
import 'package:udemy_salon/views/main/comments/comment_page.dart';
import 'package:udemy_salon/views/main/homes/salon_detail/salon_detail.dart';
import 'package:udemy_salon/views/main/messages/message_detail_screen.dart';
import 'package:udemy_salon/views/main/passive_user_profile.dart';

void toMyApp({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => const MyApp()));
void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => const SignupPage()));
void toSalonRegisterPage({required BuildContext context}) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SalonRegisterPage()));
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

void toSalonDetail({required BuildContext context, required Salon salon}) =>
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => (SalonDetail(salon: salon))));

void toCommentPage({
  required BuildContext context,
  required Post post,
  required DocumentSnapshot<Map<String, dynamic>> postDoc,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommentPage(
          post: post,
          postDoc: postDoc,
        ),
      ),
    );

// リダイレクト
void toSalonRegisterRedirect({required BuildContext context}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(builder: (context) => const SalonRegisterPage()),
      (Route<dynamic> route) => false,
    );
