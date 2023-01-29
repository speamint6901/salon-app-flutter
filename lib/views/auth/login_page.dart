// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/constants/strings.dart';
import 'package:udemy_salon/models/auth/login_model.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';
import 'package:udemy_salon/views/atoms/rounded_text_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(loginTitle),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            roundedController: emailEditingController,
            labelText: inputLabelEmail,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: false,
          ),
          RoundedTextField(
            keybordType: TextInputType.visiblePassword,
            onChanged: (text) => loginModel.password = text,
            roundedController: passwordEditingController,
            labelText: inputLabelPassword,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.green,
            obscureText: loginModel.isObscure,
          ),
          RoundedButton(
            onPressed: () async => await loginModel.login(context: context),
            widthRate: 0.4,
            color: Colors.greenAccent,
            labelText: buttonLabelLogin,
            textSize: 16,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextButton(
              onPressed: () => routes.toSignupPage(context: context),
              child: Text(textButtonSignup),
            ),
          ),
        ],
      ),
    );
  }
}
