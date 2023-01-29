import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/themes_model.dart';

class SalonDrawer extends StatelessWidget {
  const SalonDrawer({
    Key? key,
    required this.mainModel,
    required this.themeModel,
  }) : super(key: key);
  final MainModel mainModel;
  final ThemesModel themeModel;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('アカウント'),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: Text('テーマ'),
            trailing: CupertinoSwitch(
              value: themeModel.isDarkTheme,
              onChanged: (value) => themeModel.setIsDarkTheme(value: value),
            ),
          ),
          if (mainModel.firestoreUser.isAdmin)
            ListTile(
              title: Text('管理者ページ'),
              onTap: () => routes.toAdminPage(context: context),
            )
        ],
      ),
    );
  }
}
