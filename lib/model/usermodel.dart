import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class User{
  String email;
  String password;
  String rollnumber;
  String Uid;
  User({
        required this.email,
        required this.password,
        required this.rollnumber,
        required this.Uid,
      });
  Map<String ,dynamic>toJson()=>
      {
        "email":email,
        "password":password,
        "rollnumber":rollnumber,
        "Uid":Uid,
  };
  static User fromsnap(DocumentSnapshot snap)
  {
    var snapshot=snap.data() as Map<String,dynamic>;
        return User(email: snapshot["email"], password: snapshot["password"], rollnumber: snapshot["rollnumber"], Uid: snapshot["Uid"]);
  }
}