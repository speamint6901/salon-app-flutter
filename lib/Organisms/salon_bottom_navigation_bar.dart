import 'package:flutter/material.dart';
import 'package:udemy_salon/constants/bottom_navigation_bar_elements.dart';
import 'package:udemy_salon/models/bottom_navigation_bar_model.dart';

class SalonBottomNavigationBar extends StatelessWidget {
  const SalonBottomNavigationBar(
      {super.key, required this.bottomNavigationBarModel});

  final BottomNavigationBarModel bottomNavigationBarModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigationBarElements,
      currentIndex: bottomNavigationBarModel.currentIndex,
      onTap: (index) => bottomNavigationBarModel.onTabTapped(index: index),
    );
  }
}
