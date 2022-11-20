
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/auth_controller.dart';
import 'package:flutter_application_2/views/screens/add_video_screen.dart';
import 'package:flutter_application_2/views/screens/comment_screen.dart';
import 'package:flutter_application_2/views/screens/profile_screen.dart';
import 'package:flutter_application_2/views/screens/search_screen.dart';
import 'package:flutter_application_2/views/screens/video_screen.dart';
//import 'package:tiktok_tutorial/controllers/auth_controller.dart';
// import 'package:tiktok_tutorial/views/screens/add_video_screen.dart';
// import 'package:tiktok_tutorial/views/screens/profile_screen.dart';
// import 'package:tiktok_tutorial/views/screens/search_screen.dart';
// import 'package:tiktok_tutorial/views/screens/video_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),///them
  
  //Text('Messages Screen'),
 
 ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.black;//doi mau cho ung dung
var buttonColor = Color.fromARGB(255, 9, 238, 104);
const borderColor = Colors.grey;
//day la file chua cac goi va mau sac

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
