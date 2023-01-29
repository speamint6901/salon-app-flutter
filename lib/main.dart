// flutter
// packeges
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/thmes.dart';
import 'package:udemy_salon/models/bottom_navigation_bar_model.dart';
// models
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/rooms/room_model.dart';
import 'package:udemy_salon/models/themes_model.dart';
// pages
import 'package:udemy_salon/views/auth/login_page.dart';
import 'package:udemy_salon/views/auth/salon_register_page.dart';
import 'package:udemy_salon/views/main/homes/home/home_screen.dart';
import 'package:udemy_salon/views/main/messages/message_screen.dart';
import 'package:udemy_salon/views/main/posts/postting_screen.dart';
import 'package:udemy_salon/views/main/profile_screen.dart';
import 'package:udemy_salon/views/molecules/salon_drawer.dart';
import 'package:udemy_salon/views/organisms/salon_bottom_navigation_bar.dart';

import 'constants/strings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final MainModel mainModel = ref.watch(mainProvider);
    // MyAppが起動した際にユーザーがログインしているかどうかの確認
    // この変数を使うのは一回きり
    final User? onceUser = FirebaseAuth.instance.currentUser;
    final ThemesModel themesModel = ref.watch(themesProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themesModel.isDarkTheme
          ? darkThemeData(context: context)
          : lightThemeData(context: context),
      home: onceUser == null
          ? LoginPage()
          : MyHomePage(
              title: appTitle,
              themesModel: themesModel,
            ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({
    super.key,
    required this.title,
    required this.themesModel,
  });

  String title;
  final ThemesModel themesModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final RoomModel roomModel = ref.watch(roomProvider);
    final BottomNavigationBarModel bottomNavigationBarModel =
        ref.watch(bottomNavigationBarProvider);
    return Scaffold(
      drawer: SalonDrawer(mainModel: mainModel, themeModel: themesModel),
      body: (mainModel.isLoading == true)
          ? Center(
              child: Text('NowLoading...'),
            )
          // サロン未登録ならサロン登録ページへ
          : (mainModel.currentSalon == null)
              ? redirectToSalonRegister(context: context)
              : PageView(
                  controller: bottomNavigationBarModel.pageController,
                  onPageChanged: (index) {
                    bottomNavigationBarModel.onPageChanged(index: index);
                    // title = bottomNavigationBarElements[index].label!;
                  },
                  children: [
                    HomeScreen(mainModel: mainModel),
                    MessageScreen(roomModel: roomModel),
                    ProfileScreen(mainModel: mainModel),
                    PosttingScreen(),
                  ],
                ),
      bottomNavigationBar: SalonBottomNavigationBar(
        bottomNavigationBarModel: bottomNavigationBarModel,
      ),
    );
  }
}

dynamic redirectToSalonRegister({required BuildContext context}) {
  // 全ての Widget のビルドが終わったタイミングで呼ぶ
  // こうしないとstateエラーが発生する
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(builder: (context) => const SalonRegisterPage()),
      (Route<dynamic> route) => false,
    ); // エラーの出ていた処理
  });
}
