// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/views/main/homes/salon_detail/components/body.dart';

class SalonDetail extends ConsumerWidget {
  const SalonDetail({super.key, required this.salon});
  @override
  final Salon salon;
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        title: Transform(
          transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
          child: BackButton(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Container(
        child: Body(
          salon: salon,
        ),
      ),
    );
  }
}
