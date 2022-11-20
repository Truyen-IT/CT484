
import 'dart:io';//nhap theo kieu thuong

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/views/screens/auth/login_screen.dart';
import 'package:flutter_application_2/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_application_2/models/user.dart' as model;//chay cua modol
import 'package:image_picker/image_picker.dart';//goi down ve


//import 'package:firebase_auth/firebase_auth.dart';//tai goi ve
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter_application_2/views/screens/auth/login_screen.dart';
//import 'package:get/get.dart';//goi public .dev get nen thay phien ban
// import 'package:image_picker/image_picker.dart';
// import 'package:tiktok_tutorial/constants.dart';
//import 'package:tiktok_tutorial/models/user.dart' as model;
// import 'package:tiktok_tutorial/views/screens/auth/login_screen.dart';
// import 'package:tiktok_tutorial/views/screens/home_screen.dart';

class AuthController extends GetxController {
   static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
   User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());//thanh cong
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // // upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // // registering the user
  void registerUser(//phuong thuc  dang ki nguoi dung va khong cha lai gi
      String username, String email, String password, File? image) async {//hinh anh co the null
    try {
      if (username.isNotEmpty &&//la khong chong
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      String downloadUrl = await _uploadToStorage(image);//ham uploadtostore
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(//la goi get
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
