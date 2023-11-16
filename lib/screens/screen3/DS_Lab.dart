import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class DS_Lab extends StatelessWidget {
  const DS_Lab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(child: Text("1st Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1. Engineering Physics Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. IT Workshop'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. Communication English Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),

          ),
          Align(child: Text("2nd Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1. Engineering Chemistry Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. Electrical And Engineering Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. Computer programming Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("3rd Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1.Introduction to Artificial Intelligence and Machine Learning Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. Natural Language Processing'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. Java Programming Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('4. Operating Systems Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("4th Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1. Database Management Systems Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. Web Application Development Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. R Programming Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("5th Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1.Machine Learning Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. MEAN Stack Technologies'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3.Computer Networks'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("6th Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1. Algorithms for Efficient Coding'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. Analysis and Design Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. Deep Learning'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("7th Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(child: Text('1. Data Visualization Lab'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('2. Job Oriented Elective'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
                TextButton(child: Text('3. Using Tableau and Power BI'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LabPDF()));},),
              ],
            ),
          ),

          Align(child: Text("8th Semester Lab", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.topCenter,),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Center(child: Text('Full semester internship', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
          ),

        ],
      ),
    );
  }
}


class LabPDF extends StatefulWidget {
  const LabPDF({super.key});

  @override
  State<LabPDF> createState() => _LabPDFState();
}

class _LabPDFState extends State<LabPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("𝐕𝐢𝐫𝐭𝐮𝐚𝐥 𝐋𝐚𝐛 𝐄𝐱𝐩𝐞𝐫𝐢𝐦𝐞𝐧𝐭"),
      ),
      body:PDF(
        // swipeHorizontal: true,
      ).cachedFromUrl('https://aec.edu.in/thubzone/syllabus/11.%20AR23_CSE(DS)_Syllabus...pdf'),
    );
  }
}