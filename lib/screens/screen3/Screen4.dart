import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:querycircle/screens/screen3/AboutCollage.dart';
import 'AE_Lab.dart';
import 'AIML.dart';
import 'CSE.dart';
import 'Civil_Lab.dart';
import 'DS_Lab.dart';
import 'ECE_LAB.dart';
import 'IT_Lab.dart';
import 'ME.dart';
import 'Mining_Lab.dart';
import 'PT.dart';
class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {

  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: CircleAvatar(
          backgroundImage: AssetImage('asserts/adityalogo.jpg'),),
        centerTitle: true,
        title: Text('Virtual Engineering Lab', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app,color: Colors.white,),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 12,),
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img1.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img2.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img2.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img3.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img4.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img5.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asserts/img6.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ],
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          ),
          // GestureDetector(
          //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutCollage())),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          //     height: 200,
          //     width: double.infinity,
          //    decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(12),
          //      gradient: LinearGradient(colors: [Colors.yellowAccent, Colors.deepOrange, Colors.orangeAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
          //    ),
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20),
          //       child: Center(child: Text('About College', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 30),)),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Civil_Lab()));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_work_outlined, size: 60,),
                    Text("Civil Engineering", style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ECE_LAB()));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                alignment: Alignment.center,
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.cell_tower_sharp, size: 60,),
                    Text("Electronics & Communication", style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ME()));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.engineering, size: 60,),
                  Text("Mechanical Engineering", style: TextStyle(fontSize: 30),)
                ],
              ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.electrical_services_outlined, size: 60,),
                    Text("Electronics and Communication", style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CSE()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.computer_rounded, size: 60,),
                    Text("Computer Science and Engineering", style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>IT_Lab()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.computer, size: 60,),
                    Text("Information Technology", style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Mining_Lab()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings_suggest_outlined, size: 60,),
                    Text("Mining Engineering", style: TextStyle(fontSize: 30),)
                  ],
                ),

              ),
            ),
          ),
          SizedBox(height: 12,),

          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PT_Lab()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pets, size: 60,),
                    Text("Petroleum Technology", style: TextStyle(fontSize: 30),)
                  ],
                ),

              ),
            ),
          ),
          SizedBox(height: 12,),

          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AE_Lab()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.forest_rounded, size: 60,),
                    Text("Agricultural Engineering", style: TextStyle(fontSize: 30),)
                  ],
                ),

              ),
            ),
          ),


          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DS_Lab()));},
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              elevation: 15,
              shadowColor: Colors.black,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyanAccent,Colors.blueAccent
                        ]
                    )
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.data_exploration, size: 60,),
                    Text("Data Science", style: TextStyle(fontSize: 30),)
                  ],
                ),

              ),
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text('About Us', style: TextStyle(fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  CupertinoButton(
                      color: Colors.blue[900],
                      child: const Text('Virtual Labs'), onPressed: (){}),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Virtual Labs will provide to the students the result of an experiment by one of the following methods (or possibly a combination). Modeling the physical phenomenon by '
                        'a set of equations and carrying out simulations to yield the result of the particular experiment.', style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  CupertinoButton(
                      color: Colors.blue[900],
                      child: const Text('Objectives'), onPressed: (){}),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('To provide remote-access to Labs in various disciplines of Science '
                        'and Engineering. These Virtual Labs would cater to students at the undergraduate level, post graduate level as well as to research scholars', style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CupertinoButton(
                      color: Colors.blue[900],
                      child: const Text('The Philosophy'), onPressed: (){}),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Physical distances and the lack of resources make us unable to perform experiments, especially when they involve sophisticated instruments. Also, good teachers are always a scarce resource. Web-based and video-based courses'
                        ' address the issue of teaching to some extent.', style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text("CONTACT US", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      Text('Name'),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          hintText:"Enter name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      Text('Email*'),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          hintText:"Enter Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      Text('Number*'),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          hintText:"Enter number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      Text('Name of Your Branch*'),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          hintText:"Enter Branch",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      Text('Your Quary'),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            hintText:"Quary",
                            border: OutlineInputBorder(),
                            helperMaxLines: 4
                        ),
                      ),
                    ],
                  ),
                ),
              ],),
            ),
          ),
          Image.asset('asserts/adityalogo.jpg'),
          SizedBox(height: 12,),

        ],
      ),
    );
  }
}

