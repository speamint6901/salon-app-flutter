// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/salons/salon.dart';

final searchProvider = ChangeNotifierProvider(((ref) => SearchModel()));

class SearchModel extends ChangeNotifier {
  List<Salon> salons = [];
  SearchModel() {
    init();
  }
  Future<void> init() async {
    final QuerySnapshot<Map<String, dynamic>> qshot =
        await FirebaseFirestore.instance.collectionGroup('salons').get();
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    salons = docs.map((e) => Salon.fromJson(e.data()!)).toList();
    notifyListeners();
  }
}
