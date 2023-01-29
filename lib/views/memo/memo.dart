// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/models/memo/memo_model.dart';

class Memo extends ConsumerWidget {
  const Memo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MemoModel memoModel = ref.watch(memoProvider);
    // memoModel.create();
    memoModel.getMemoList();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: memoModel.memos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(memoModel.memos[index].title),
          );
        },
      ),
    );
  }
}
