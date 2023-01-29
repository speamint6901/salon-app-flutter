import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckbox extends ConsumerWidget {
  CustomCheckbox({
    Key? key,
    required this.checkboxItem,
  }) : super(key: key);

  final Map<String, dynamic> checkboxItem;
  final checkboxValProvider = StateProvider.autoDispose((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: checkboxItem['width'],
      child: CheckboxListTile(
        title: Text(checkboxItem['label']),
        controlAffinity: ListTileControlAffinity.leading,
        value: ref.watch(checkboxValProvider),
        onChanged: (value) {
          ref.read(checkboxValProvider.notifier).state = value!;
          print(checkboxItem['label']);
        },
      ),
    );
  }
}
