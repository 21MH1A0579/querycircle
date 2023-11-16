import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querycircle/screens/userhomescreen.dart';
import 'package:firebase_database/firebase_database.dart';

import 'homepage.dart';
import 'model/usermodel.dart' as model;

class AuthController extends GetxController {

  late String USERID;
  late Rx<User?>_user;
  static AuthController instance = Get.find();
  int postid=0;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialscreen);
  }
  _setInitialscreen(User? user) {
    if (user == null) {
      Get.offAll(() => homepage());
    }
    else {
      if(user.emailVerified)
        {
          //Get.offAll(()=>const UserMainPage());
          Get.off(()=>HomeScreen());
        }
      else {
        Get.offAll(() => homepage());
      }
    }
  }
void ForgotPasswordController(String forgotemail) async
{
  try
      {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: forgotemail).then((value) => {
              Get.snackbar("Reset Your Password", "Reset Password Mail is Sent.",backgroundColor: Colors.white,colorText: Colors.orange),
          Get.off(()=>homepage())

        }
        );
      }
      catch(e)
      {
        Get.snackbar("Error in Password Reset", e.toString(),margin: const EdgeInsets.only(
          top: 35,
          left: 10,
          right: 10,
        ),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.notifications_active, color: Colors.white,),
            duration: const Duration(seconds: 3),
            backgroundGradient: RadialGradient(
                radius: 10,
                colors: [Colors.red.shade700, Colors.white]
            ));
      }
}
  void SignupController(String email, String password,
      String retypepassword) async
  {
    try {
      if (email.isNotEmpty && password.isNotEmpty &&
          retypepassword.isNotEmpty)
      {
        if (password != retypepassword) {
          Get.snackbar(
            "Error in Creating an Account", "Password Doesn't match",
          );
        }
        else if (email.endsWith("@acoe.edu.in") || email.endsWith("@acet.ac.in") ||
            email.endsWith("@aec.edu.in") || email
            .substring(2, 3)
            .capitalize == "MH" || email
            .substring(2, 3)
            .capitalize == "P3" || email
            .substring(2, 3)
            .capitalize == "A9") {
          UserCredential cred = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          Get.snackbar(
              "Hurraih", "Register Success",
              margin: const EdgeInsets.only(
                top: 35,
                left: 10,
                right: 10,
              ),
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: const Icon(Icons.notifications_active, color: Colors.white,),
              duration: const Duration(seconds: 3),
              backgroundGradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.green.shade500]
              )
          );
          if(!(FirebaseAuth.instance.currentUser!.emailVerified))
            {
              Get.snackbar("Please verify", "Your Email address",backgroundColor: Colors.white,colorText: Colors.orange);
            }

            model.User user = model.User(email: email,
                password: password,
                rollnumber: email.substring(0, 10),
                Uid: cred.user!.uid);
            FirebaseFirestore.instance.collection("Users")
                .doc(cred.user!.uid)
                .set(user.toJson());
         }
        else {
          Get.snackbar("Error in Creating an Account",
              "Please enter College Email Only");
        }
      }
      else {
        Get.snackbar("Error in Creating an Account", "Please Enter All Feilds",
            margin: const EdgeInsets.only(
              top: 35,
              left: 10,
              right: 10,
            ),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.notifications_active, color: Colors.white,),
            duration: const Duration(seconds: 3),
            backgroundGradient: RadialGradient(
                radius: 10,
                colors: [Colors.red.shade700, Colors.white]
            )
        );
      }
    }
    catch (e) {
      Get.snackbar("Error in Creating an Account", e.toString(),
          margin: const EdgeInsets.only(
            top: 35,
            left: 10,
            right: 10,
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.notifications_active, color: Colors.white,),
          duration: const Duration(seconds: 3),
          backgroundGradient: RadialGradient(
              radius: 10,
              colors: [Colors.red.shade700, Colors.white]
          )
      );
    }
  }

  void LoginController(String email, String password) async
  {
    try {
      if (email.isNotEmpty && password.isNotEmpty)
      {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);
        if(!(FirebaseAuth.instance.currentUser!.emailVerified))
        {
          Get.snackbar( margin: const EdgeInsets.only(
            top: 35,
            left: 10,
            right: 10,
          ),"Please verify your email", "check your Inbox",colorText: Colors.orange,backgroundColor: Colors.white);
        }
        else {
          //Get.offAll(()=>const UserMainPage());
          Get.offAll(()=> HomeScreen());
          Get.snackbar("Welcome", "Login Success",
              margin: const EdgeInsets.only(
                top: 35,
                left: 10,
                right: 10,
              ),
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: const Icon(
                Icons.notifications_active, color: Colors.white,),
              duration: const Duration(seconds: 3),
              backgroundGradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.green.shade500]
              )
          );
        }
      }
      else {
        Get.snackbar(
            "Error in Login", "Please Enter Input Feilds",
            margin: const EdgeInsets.only(
              top: 35,
              left: 10,
              right: 10,
            ),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.notifications_active, color: Colors.white,),
            duration: const Duration(seconds: 3),
            backgroundGradient: RadialGradient(
                radius: 10,
                colors: [Colors.red.shade700, Colors.white]
            )

        );
      }
    }
    catch (e) {
      Get.snackbar("Error in Login", e.toString(),
          margin: const EdgeInsets.only(
            top: 35,
            left: 10,
            right: 10,
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.notifications_active, color: Colors.white,),
          duration: const Duration(seconds: 3),
          backgroundGradient: RadialGradient(
              radius: 10,
              colors: [Colors.red.shade700, Colors.white]
          )
      );
    }
  }

  void Signout() async {
    await FirebaseAuth.instance.signOut();
  }

}