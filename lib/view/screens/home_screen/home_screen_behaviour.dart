import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';

import '../../../constants/constants.dart';
import '../../../model/ViewUrlModel/View_url_model.dart';

class HomeScreenBehaviour extends StatelessWidget {
  const HomeScreenBehaviour({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CircleAvatar(
            backgroundImage: AssetImage(
          'assets/images/m_logo.png',
        )),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        actions: [
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, PageName.messageUserLists);
            },
            child: Text(
              'Messages',style: TextStyle(color: Constants.wightColor,fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.white,),

            ),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, PageName.assignmentsScreen);
            },
            child: Text(
              'Assignments',style: TextStyle(color: Constants.wightColor,fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.white,),

            ),
          ),
          SizedBox(width: 20,),
          Container(
            margin: EdgeInsets.all(5),
            height: 40,
            width: 110,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Constants.darkPink.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
                  'Log Out',
                  style: GoogleFonts.playfairDisplay().copyWith(
                      color: Constants.darkPink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
        backgroundColor: Constants.darkPink,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .03, vertical: height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.addCourseScreen);
                    },
                    child: customContainer(
                        imagePath: 'assets/images/course.webp',
                        title: 'Courses',
                        height: height,
                        width: width),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.enrolledStudentsScreen);
                    },
                    child: customContainer(
                        imagePath: 'assets/images/enrolled.webp',
                        title: 'Enrolled Students',
                        height: height,
                        width: width),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.allStudentsScreen);
                    },
                    child: customContainer(
                        imagePath: 'assets/images/all.webp',
                        title: 'All Users',
                        height: height,
                        width: width),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .03, vertical: height * .01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.adminAndEdotorScreen,);
                    },
                    child: customContainer(
                        imagePath: 'assets/images/teacher.webp',
                        title: 'Editor/Teacher',
                        height: height,
                        width: width),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.openWebSiteScreen,arguments: ViewUrlModel(title: 'Term & Condition',url: 'https://www.africau.edu/images/default/sample.pdf'));
                    },
                    child: customContainer(
                        imagePath: 'assets/images/term.webp',
                        title: 'Term & Condition',
                        height: height,
                        width: width),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.openWebSiteScreen,arguments: ViewUrlModel(title: 'Privacy',url: 'https://www.africau.edu/'));
                    },
                    child: customContainer(
                        imagePath: 'assets/images/privacy.webp',
                        title: 'Privacy',
                        height: height,
                        width: width),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customContainer(
      {String? imagePath, String? title, double? height, double? width}) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            height:height!*.40,
            width:width!*.30,
            imagePath!,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: height! * .01,
          ),
          Text(
            title.toString()!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
