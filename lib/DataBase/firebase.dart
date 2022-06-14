import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
 String Username="gig";
 String phone_num="hkguyyu";
 String Email_add="";
FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');
final storageRef = FirebaseStorage.instance.ref();



Future CreateUser(String name, String phone_no) async {
  final docuser =
      FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid);
  final details = {
    'name': name,
    'Email_address': auth.currentUser!.email,
    'mobile_Number': phone_no,
  };
  await docuser.update(details);
}


Future  readDetails()async{
  final collection=FirebaseFirestore.instance.collection('Users');
  final docsnap=await collection.doc(auth.currentUser!.uid).get();
  if(docsnap.exists){
    Map<String,dynamic> ? data=docsnap.data();
    Username =data?['name'];
    Email_add =data ?['Email_address'];
    phone_num=data?['mobile_Number'];

  }
}