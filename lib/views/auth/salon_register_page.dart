// flutter
import 'package:flutter/material.dart';
import 'package:udemy_salon/views/auth/components/salon_stepper.dart';

class SalonRegisterPage extends StatelessWidget {
  const SalonRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('サロン登録'),
      ),
      body: SalonStepper(),
    );
  }
}
