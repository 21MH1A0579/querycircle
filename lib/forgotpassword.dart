import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:querycircle/textfeild.dart';

import 'controller.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController forgotemailcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange.shade900,
                    Colors.orange.shade800,
                  ]
              ),

              // image: DecorationImage(
              //  fit: BoxFit.cover,
              //   image: NetworkImage("https://cdn.pixabay.com/photo/2023/08/26/18/01/planet-8215532_1280.png"),
              // )
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60,left:22),
              child: Text("Hello\nReset Your Password !",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: double.maxFinite,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55)
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      backgroundImage:AssetImage("asserts/adityalogo.jpg"),
                      maxRadius: 75,
                    ),
                  ),
                  const SizedBox(height: 45,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputTextFeild(icon: Icons.email,label: "Enter Your College Email",controller: forgotemailcontroller,),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      onTap:()=>AuthController.instance.ForgotPasswordController(forgotemailcontroller.text.trim()),

                      splashColor: Colors.red,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.orange.shade600,
                                  Colors.orange.shade900,
                                ]
                            )
                        ),
                        width: double.infinity,
                        height: 55,
                        child: const Center(child:Text("Reset Password",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
