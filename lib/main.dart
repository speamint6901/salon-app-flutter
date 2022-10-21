// flutter
// packeges
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/Molecules/salon_drawer.dart';
import 'package:udemy_salon/Organisms/salon_bottom_navigation_bar.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/constants/thmes.dart';
import 'package:udemy_salon/models/bottom_navigation_bar_model.dart';
// models
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/themes_model.dart';
// pages
import 'package:udemy_salon/views/login_page.dart';
import 'package:udemy_salon/views/main/home_screen.dart';
import 'package:udemy_salon/views/main/message_screen.dart';
import 'package:udemy_salon/views/main/postting_screen.dart';
import 'package:udemy_salon/views/main/profile_screen.dart';

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
          : MyHomePage(title: appTitle, themesModel: themesModel),
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
    final BottomNavigationBarModel bottomNavigationBarModel =
        ref.watch(bottomNavigationBarProvider);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      // ),
      drawer: SalonDrawer(mainModel: mainModel, themeModel: themesModel),
      body: (mainModel.isLoading == true)
          ? Center(
              child: Text('NowLoading...'),
            )
          : PageView(
              controller: bottomNavigationBarModel.pageController,
              onPageChanged: (index) {
                bottomNavigationBarModel.onPageChanged(index: index);
                // title = bottomNavigationBarElements[index].label!;
              },
              children: [
                HomeScreen(mainModel: mainModel),
                MessageScreen(),
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
