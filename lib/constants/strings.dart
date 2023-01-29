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

// サロン情報 登録・編集カラム名
const String cSalonName = "サロン名・店舗名";
const String cUserName = "お名前";
const String cPostalCode = "郵便番号";
const String cPrefName = "都道府県";
const String cCityName = "市区町村";
const String cAddress1 = "住所１(以降の住所・番地など)";
const String cAddress2 = "住所２(部屋番号など）";
const String cCategories = "ジャンル・カテゴリー";
const String cDescription = "挨拶文・紹介文(200文字以内)";
const String cUserImage = "アバター画像アップロード";
const String cMainImage = "メイン店舗画像";

// file name
String returnUuidV4() {
  final Uuid uuid = Uuid();
  return uuid.v4().toString();
}

String returnJpgFileName() {
  return "${returnUuidV4()}.jpg";
}

// バリデーションメッセージ
const String requiredValidatorMessage = "必須項目です。";
