import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

late final Username;
late final phone_no;
late final profile_pic;
FirebaseAuth auth = FirebaseAuth.instance;
String uid = auth.currentUser!.uid.toString();
late CollectionReference users;
Future<void> CreateUserData() async {
   users = FirebaseFirestore.instance.collection('Users');
  users.add({
    'name': Username,
    'email_id': auth.currentUser!.email,
    'ph_no': phone_no,
    'uid': uid,
    'profile_pic': profile_pic,
  });
}

Future<void> createNewUserInFirestore() async{
   await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).set({
    'name': Username,
    'email_id': auth.currentUser!.email,
    'ph_no': phone_no,
    'uid': uid,
    'profile_pic': profile_pic,
  });
}
