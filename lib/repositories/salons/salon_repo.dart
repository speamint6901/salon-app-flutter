import 'package:cloud_firestore/cloud_firestore.dart';

class SalonRepo {
  Future<DocumentReference> hasSalonData({required String uid}) async {
    final docShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('salons')
        .doc(uid);

    return docShot;
  }
}
