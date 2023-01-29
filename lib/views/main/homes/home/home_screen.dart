import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/themes_model.dart';
import 'package:udemy_salon/views/main/homes/home/components/body.dart';
import 'package:udemy_salon/views/molecules/salon_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemesModel themesModel = ref.watch(themesProvider);

    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: buildAppBar(),
      drawer: SalonDrawer(mainModel: mainModel, themeModel: themesModel),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'サロンAPP',
        style: TextStyle(color: kPrimaryColor),
      ),
      actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
    );
  }
}
