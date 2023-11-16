//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:studentoutpass/addoutpass.dart';
// class UserMainPage extends StatefulWidget {
//   const UserMainPage({super.key});
//
//   @override
//   State<UserMainPage> createState() => _UserMainPageState();
// }
//
// class _UserMainPageState extends State<UserMainPage> {
//   String rollnumber="";
//   bool img=true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getuserdata();
//   }
//  void getuserdata() async
//   {
//     DocumentSnapshot snap= await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();
//     setState(() {
//       rollnumber=(snap.data()as Map<String,dynamic>)["rollnumber"];
//
//     });
//     img=false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent.shade400,
//         actions: [IconButton(onPressed: (){
//         FirebaseAuth.instance.signOut();
//       }, icon: const Icon(Icons.logout))],),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 25,),
//            Container(
//              height: 200,
//             width: 380,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomRight,
//                 colors: [Colors.redAccent.shade400,Colors.redAccent]
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  Row(
//                    children: [
//                      img?const CircularProgressIndicator(
//                        color: Colors.red,
//                      ):Padding(
//                        padding: const EdgeInsets.all(10.0),
//                        child: CircleAvatar(
//                          maxRadius: 65,
//                          backgroundImage:AssetImage("asserts/profileicon.png"),
//                          foregroundImage:NetworkImage(Url(rollnumber).toString(),),
//                          backgroundColor: Colors.orangeAccent,
//                        ),
//                      ),
//                      Text("NAME : CHALUMURI BRAHMENDRA\n\nROLL NUMBER : $rollnumber\n\nBLOCK : D\n\nROOMNO : 412",style: TextStyle(color: Colors.white),),
//                    ],
//                  ),
//
//                ],
//              ),
//            ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Text("HISTORY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.green),),
//             ),
//              WidgetTextTile(title: "Holidaypass", Discription: "due to holiday", suffixicon: Icons.check_circle,iconcolor: Colors.green,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Evening Pass", Discription: "for haircut", suffixicon: Icons.close_rounded,iconcolor: Colors.red,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Holidaypass", Discription: "due to holiday", suffixicon: Icons.check_circle,iconcolor: Colors.green,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Evening Pass", Discription: "for haircut", suffixicon: Icons.check_circle,iconcolor: Colors.green,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Holidaypass", Discription: "due to holiday", suffixicon: Icons.check_circle,iconcolor: Colors.green,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Evening Pass", Discription: "for haircut", suffixicon: Icons.close_rounded,iconcolor: Colors.red,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Holidaypass", Discription: "due to holiday", suffixicon: Icons.close_rounded,iconcolor: Colors.red,),
//             SizedBox(height: 5,),
//             WidgetTextTile(title: "Evening Pass", Discription: "for haircut", suffixicon: Icons.close_rounded,iconcolor: Colors.red,),
//           ],
//         ),
//       ),
//       bottomNavigationBar:Padding(
//         padding: const EdgeInsets.only(bottom: 35),
//         child: FloatingActionButton(
//           tooltip: "add new pass",
//           elevation: 10,
//           highlightElevation: 25,
//           backgroundColor: Colors.green,
//           onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddOutpass()));},child: Icon(Icons.add,color:Colors.white,size: 55,),),
//       ),
//     );
//   }
// }
// String? Url(String rollnumber)
// {
//   if(rollnumber.substring(2,4).toUpperCase()=="MH")
//   {
//     return "https://info.aec.edu.in/ACOE/StudentPhotos/$rollnumber.jpg";
//   }
//   else if(rollnumber.substring(2,4).toUpperCase()=="A9")
//   {
//     return "https://info.aec.edu.in/AEC/StudentPhotos/$rollnumber.jpg";
//   }
//   else
//   {
//     return "https://info.aec.edu.in/ACET/StudentPhotos/$rollnumber.jpg";
//   }
// }
// class WidgetTextTile extends StatelessWidget {
//   final String title;
//   final String Discription;
//   final IconData suffixicon;
//   final Color iconcolor;
//    WidgetTextTile(
//        {
//          super.key,
//          required this.title,
//          required this.Discription,
//          required this.suffixicon,
//          required this.iconcolor
//    });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       shape: RoundedRectangleBorder(
//         side: BorderSide(color: Colors.black,width: 1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       title:Text(title),
//       subtitle: Text(Discription),
//       trailing: Icon(suffixicon,color: iconcolor,size: 35,),
//     );
//   }
// }
