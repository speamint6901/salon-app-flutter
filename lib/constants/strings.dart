import 'package:uuid/uuid.dart';

const String appTitle = "サロン";
const String signupTitle = "新規登録";
const String loginTitle = "ログイン";
const String inputLabelUserName = "サロン名";
const String inputLabelEmail = "メールアドレス";
const String inputLabelPassword = "パスワード";
const String buttonLabelSignup = "新規登録";
const String textButtonSignup = "アカウントをお持ちで無い方はこちら";
const String buttonLabelLogin = "ログイン";

// file name
String returnUuidV4() {
  final Uuid uuid = Uuid();
  return uuid.v4().toString();
}

String returnJpgFileName() {
  return "${returnUuidV4()}.jpg";
}
