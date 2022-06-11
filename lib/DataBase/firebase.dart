import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth = FirebaseAuth.instance;
Future CreateUser(String name, String phone_no) async {
  final docuser =
      FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid);
  final json = {
    'name': name,
    'Email_address': auth.currentUser!.email,
    'mobile_Number': phone_no,

  };
  await docuser.set(json);
}
