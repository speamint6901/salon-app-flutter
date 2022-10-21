import 'package:flutter/material.dart';
import 'package:udemy_salon/models/main_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('ログアウトする'),
            onTap: () =>
                mainModel.logout(context: context, mainModel: mainModel),
          ),
        ],
      ),
    );
  }
}
