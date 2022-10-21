import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/Molecules/salon_drawer.dart';
import 'package:udemy_salon/constants/routes.dart';
import 'package:udemy_salon/domain/firestore_user/firestore_user.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/search_model.dart';
import 'package:udemy_salon/models/themes_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    final ThemesModel themesModel = ref.watch(themesProvider);
    return Scaffold(
        appBar: buildAppBar(),
        drawer: SalonDrawer(mainModel: mainModel, themeModel: themesModel),
        body: ListView.builder(
          itemCount: searchModel.users.length,
          itemBuilder: (context, index) {
            final FirestoreUser firestoreUser = searchModel.users[index];
            return ListTile(
              title: Text(firestoreUser.uid),
              onTap: () => toPassiveUserProfile(
                  context: context,
                  passiveUser: firestoreUser,
                  mainModel: mainModel),
            );
          },
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('ホーム'),
    );
  }
}
