import 'package:flutter/material.dart';
import 'package:querycircle/textfeild.dart';

import 'controller.dart';
import 'forgotpassword.dart';
import 'screens/postscreen/newpost.dart';
import 'signinscreen.dart';
class homepage extends StatefulWidget {
   homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 bool IsLoginpageLoading=false;
TextEditingController emailcontroller=new TextEditingController();

TextEditingController passwordcontroller=new TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

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
              child: Text("Hello\nSign in!",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
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
                    child: InputTextFeild(icon: Icons.email,label: "Enter Your College Email",controller: emailcontroller,),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InputTextFeild(icon: Icons.password,label: "Enter Your Password",IsObscure: true,controller: passwordcontroller,),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      onTap:()
                      {
                        if(emailcontroller.text.trim()=="admin" && passwordcontroller.text.trim()=="admin@123")
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
                          }
                        else {
                          AuthController.instance.LoginController(
                              emailcontroller.text.trim(),
                              passwordcontroller.text.trim());
                          IsLoginpageLoading = true;
                        }

                      },

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
                        child: Center(child: IsLoginpageLoading?const CircularProgressIndicator(color: Colors.white,):const Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account ? ",style: TextStyle(fontSize:17),),
                      InkWell(
                        splashColor: Colors.orange,
                        focusColor: Colors.orange,
                        hoverColor: Colors.orange,
                        highlightColor: Colors.orange,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                        },
                        child: const Text("Register",
                          style: TextStyle(color: Colors.orange,fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 150,
                    ),
                    child: InkWell(
                      splashColor: Colors.orange,
                      focusColor: Colors.orange,
                      hoverColor: Colors.orange,
                      highlightColor: Colors.orange,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordPage()));
                      },
                      child: const Text("Forgot Password",
                        style: TextStyle(color: Colors.orange,fontSize: 17,fontWeight: FontWeight.bold),
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
