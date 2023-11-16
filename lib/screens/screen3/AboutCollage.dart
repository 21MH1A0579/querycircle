import 'package:flutter/material.dart';
class AboutCollage extends StatelessWidget {
  const AboutCollage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Collage'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Aditya Engineering College\n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(
                    "Aditya Engineering College was established in the academic year 2001-02 under the aegis of Aditya Academy, Kakinada with the approval of AICTE and Affiliated to JNTU with an intake of 180 in three UG Courses in Engineering & Technology."

                    "The College is situated in an eco-friendly area of 180 acres with thick greenery at Surampalem, Gandepalli Mandal, East Godavari District, Andhra Pradesh. The College is 15 KM away from Samalkot Railway Station on Howrah-Chennai Railway line in South Central Railway. The College is 35 Km away from Kakinada and Rajahmundry on ADB Road."

                   " The College has four academic Buildings with a total carpet area of 35,425 Sq. Mts. apart from two boys hostels and one girls hostel buildings. The particulars of academic buildings and the departments / offices accommodated are as follows.",softWrap: true,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 SizedBox(height: 5,),
                 Text(  " S.No	Building Name	Department/Office"
                   " 1	Cotton Bhavan	Administrative Office, Examination Cell, Accounts, Admission Office, ECE."
                   " 2	K. L. Rao Bhavan	Mechanical, Electrical, Petroleum Technology,Mining Engineering"
                  "  3	Bill Gates Bhavan	CSE, IT, H&BS, Civil,Agricultural Engineering,Management Sciences."
                  "  4	Abdul Kalam Bhavan	MCA and Polytechnic Courses."
                    "The college proudly offers 11 UG and 10 PG programmes in engineering, MCA, MBA and MBA (Integrated) with 15 years of rich standing in the educational era. Besides, the college has added many feathers in its cap which include AA+ Grade by Careers 360, South India 4th rank by Digital Mailers, South India 6th rank by Silicon India, 13th rank out of top 25 engineering colleges by 4Ps, a niche in Asia top 100 colleges by WCRC leaders, Best Placement Award by ASSOCHAM, All India 98th rank-DQ CMR top T-School survey by DATA Quest and 13th position in Top 20 colleges of India by the Sunday Indian. These distinct recognitions speak volumes of the institute’s objective to promote engineering excellence. The total student strength is 5052 with faculty strength of 355 thus giving rise to healthy faculty student ratio."

    "  It is approved by AICTE, recognized by Govt. of Andhra Pradesh, permanently affiliated to Jawaharlal Nehru Technological University Kakinada (JNTUK) and is accredited by National Assessment And Accreditation Council (NAAC) with ‘A++’ Grade. The college also received UGC recognition under Sections 2(f) and 12 (B) of the UGC Act.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
