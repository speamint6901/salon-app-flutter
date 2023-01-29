import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:udemy_salon/models/main_model.dart';

void showFlashBar({
  required BuildContext context,
  required MainModel mainModel,
  required TextEditingController textEditingController,
  required void Function(String)? onChanged,
  required String titleString,
  required Color primaryActionColor,
  required Widget Function(BuildContext, FlashController<Object?>,
          void Function(void Function()))?
      primaryActionBuilder,
}) {
  context.showFlashBar(
    persistent: true,
    content: Form(
      child: TextFormField(
        controller: textEditingController,
        style: const TextStyle(fontWeight: FontWeight.bold),
        onChanged: onChanged,
        maxLength: 10,
      ),
    ),
    title: Text(titleString),
    primaryActionBuilder: primaryActionBuilder,
    // 閉じる時の動作
    negativeActionBuilder: (context, controller, _) {
      return InkWell(
        child: Icon(Icons.close),
        onTap: () async => await controller.dismiss(),
      );
    },
  );
}
