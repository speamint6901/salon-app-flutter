// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/atoms/rounded_button.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/models/admin_model.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AdminModel adminModel = ref.watch(adminProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('管理者ページ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RoundedButton(
              onPressed: () => adminModel.admin(),
              widthRate: 0.85,
              color: kPrimaryColor,
              labelText: '管理者',
            ),
          ),
        ],
      ),
    );
  }
}
