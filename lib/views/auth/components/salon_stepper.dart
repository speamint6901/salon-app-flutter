import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/constants/ints.dart';
import 'package:udemy_salon/constants/list_items.dart';
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/providers/postal_code.dart';
import 'package:udemy_salon/providers/salon_form_provider.dart';
import 'package:udemy_salon/providers/step_provider.dart';
import 'package:udemy_salon/validator/validator.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';
import 'package:udemy_salon/views/auth/components/custom_checkbox.dart';

class SalonStepper extends ConsumerWidget {
  const SalonStepper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentStep = ref.watch(stepProvider);
    final userNameController =
        TextEditingController(text: ref.watch(userNameProvider));
    return Stepper(
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              if (currentStep != firstStepCount)
                RoundedButton(
                  onPressed: details.onStepCancel,
                  widthRate: 0.25,
                  color: kPrimaryColor,
                  labelText: "戻る",
                  textSize: 14.0,
                ),
              if (currentStep != lastStepCount)
                RoundedButton(
                  onPressed: details.onStepContinue,
                  widthRate: 0.25,
                  color: kPrimaryColor,
                  labelText: "次へ",
                  textSize: 14.0,
                ),
            ],
          ),
        );
      },
      type: StepperType.horizontal,
      currentStep: currentStep,
      // stepper処理 次へ
      onStepContinue: () => {
        if (currentStep < lastStepCount)
          ref.read(stepProvider.notifier).state += 1
      },
      // stepper処理 戻る
      onStepCancel: () => {
        if (currentStep > firstStepCount)
          ref.read(stepProvider.notifier).state -= 1
      },
      steps: [
        Step(
          state: StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('サロン基本情報'),
          content: Container(
            // color: Colors.red,
            child: Column(
              children: [
                CustomTextField(
                  labelText: cUserName,
                  width: 500,
                  height: 50,
                  validator: (value) {
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: cSalonName,
                  width: 500,
                  height: 50,
                  validator: (value) {
                    return null;
                  },
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomTextField(
                        width: 150.0,
                        height: 50.0,
                        labelText: cPostalCode,
                        validator: (value) {
                          String key = "郵便番号";
                          final CustomValidator customValidator =
                              CustomValidator();
                          if (!customValidator.isValidRequiredText(value)) {
                            return customValidator.getMessage(key: key);
                          }
                          if (!customValidator.isValidNum(value)) {
                            return customValidator.getMessage(key: key);
                          }
                          if (!customValidator.isValidFixedLength(value, 7)) {
                            return customValidator.getMessage(key: key);
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: RoundedButton(
                        onPressed: () async => await ref
                            .watch(postCodeToAddressProvider)
                            .when(
                              data: (elm) => print(elm),
                              error: (err, stack) => Text(err.toString()),
                              loading: () => const CircularProgressIndicator(),
                            ),
                        widthRate: 0.45,
                        color: kSecondaryColor,
                        labelText: '郵便番号から設定',
                        textSize: 14,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                      labelText: cPrefName,
                      width: 200,
                      height: 50,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: cCityName,
                  width: 500,
                  height: 50,
                  validator: (value) {
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: cAddress1,
                  width: 500,
                  height: 50,
                  validator: (value) {
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: cAddress2,
                  width: 500,
                  height: 50,
                  validator: (value) {
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: cDescription,
                  width: 500,
                  height: 170,
                  maxLine: 10,
                  validator: (value) {
                    return null;
                  },
                ),
                Row(
                  children: const [
                    Text(
                      cCategories,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '＊複数選択可',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    for (final category in categoriesMapping)
                      CustomCheckbox(checkboxItem: category),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                    onPressed: () => print(userNameController.text),
                    widthRate: 0.3,
                    color: kSecondaryColor,
                    labelText: "テスト",
                    textSize: 14)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text('画像アップロード'),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text('完了'),
          content: Container(),
        ),
      ],
    );
  }
}

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.validator,
    required this.labelText,
    this.maxLine,
  }) : super(key: key);

  final double width;
  final double height;
  final String labelText;
  final int? maxLine;
  final validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      width: width,
      height: height,
      child: TextFormField(
        maxLines: maxLine ?? 1,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) =>
            ref.read(postalCodeProvider.notifier).state = value,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.3),
          ),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
