import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataService extends ChangeNotifier {
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot> readMyUsersInfo(String uid) async {
    return usersCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String nickname, String car_number, String uid) async {
    await usersCollection.add({
      'uid': uid,
      'nickname': nickname,
      'car_number': car_number,
    });
    notifyListeners();
  }
}
