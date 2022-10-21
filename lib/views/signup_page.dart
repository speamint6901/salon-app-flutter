// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/atoms/rounded_button.dart';
import 'package:udemy_salon/atoms/rounded_text_field.dart';
// constants
import 'package:udemy_salon/constants/strings.dart';
// models
import 'package:udemy_salon/models/signup_model.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController userNameEditingController =
        TextEditingController(text: signupModel.userName);
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
            keybordType: TextInputType.name,
            onChanged: (text) => signupModel.userName = text,
            roundedController: userNameEditingController,
            labelText: inputLabelUserName,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: false,
          ),
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            roundedController: emailEditingController,
            labelText: inputLabelEmail,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: false,
          ),
          RoundedTextField(
            keybordType: TextInputType.visiblePassword,
            onChanged: (text) => signupModel.password = text,
            roundedController: passwordEditingController,
            labelText: inputLabelPassword,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: signupModel.isObscure,
          ),
          RoundedButton(
            onPressed: () async =>
                await signupModel.createUser(context: context),
            widthRate: 0.4,
            color: Colors.green,
            labelText: buttonLabelSignup,
          ),
        ],
      ),
    );
  }
}
