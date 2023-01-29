// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nil/nil.dart';
// constants
import 'package:udemy_salon/constants/strings.dart';
// models
import 'package:udemy_salon/models/auth/signup_model.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';
import 'package:udemy_salon/views/atoms/rounded_text_field.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final emailErrorMsg = ref.watch(emailErrorMessageProvider);
    final passwordErrorMsg = ref.watch(passwordErrorMessageProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(signupTitle),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) {
              signupModel.email = text;
              ref.read(emailErrorMessageProvider.notifier).state = '';
            },
            roundedController: emailEditingController,
            labelText: inputLabelEmail,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: false,
          ),
          Center(
            child: emailErrorMsg != ''
                ? Text(
                    emailErrorMsg.toString(),
                    style: TextStyle(color: Colors.red),
                  )
                : nil,
          ),
          RoundedTextField(
            keybordType: TextInputType.visiblePassword,
            onChanged: (text) {
              signupModel.password = text;
              ref.read(passwordErrorMessageProvider.notifier).state = '';
            },
            roundedController: passwordEditingController,
            labelText: inputLabelPassword,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: signupModel.isObscure,
          ),
          Center(
            child: passwordErrorMsg != ''
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      passwordErrorMsg.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : nil,
          ),
          RoundedButton(
            onPressed: () async =>
                await signupModel.createUser(context: context, ref: ref),
            widthRate: 0.4,
            color: Colors.green,
            labelText: buttonLabelSignup,
            textSize: 16,
          ),
        ],
      ),
    );
  }
}
