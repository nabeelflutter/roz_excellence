import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/view_lesson_list/view_lesson_list.dart';
class EnrolledStudentViewScreen extends StatefulWidget {
  const EnrolledStudentViewScreen({super.key});

  @override
  State<EnrolledStudentViewScreen> createState() => _EnrolledStudentViewScreenState();
}

class _EnrolledStudentViewScreenState extends State<EnrolledStudentViewScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Constants.wightColor,
            )),
        title: Text(
          'Enrolled Student',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: Row(children: [
        Expanded(
            flex: 3,
            child: Container(color: Colors.transparent,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  height:height*.40,
                  decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/course.webp',
                      ),
                      fit: BoxFit.fill
                    )
                ),),
                  Text('User Email:   megi123@gmail.com'),
                  Text('Phone Number:  +17027800034'),
                  Container(
                    height:height*.10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.greyColorr),
                    ),child: Center(child: Text('Patrick',style: TextStyle(fontWeight: FontWeight.bold),),),),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, PageName.messageUserLists);
                    },
                    child: Container(
                      height:height*.10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Constants.greyColorr),
                      ),child: Center(child: Text('Message',style: TextStyle(fontWeight: FontWeight.bold),)),),
                  ),
              ],),
            ),
            )),
        Expanded(
            flex: 7,
            child: Container(color: Colors.transparent,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Container(
                  height:height*.10,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.greyColorr),
                  ),child: Center(child: Text('Machine Learning Course',style: TextStyle(fontWeight: FontWeight.bold),)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                    width: width*.30,
                    height:height*.10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.greyColorr),
                    ),child: Center(child: Text('Registration Date',style: TextStyle(fontWeight: FontWeight.bold),)),),
                  Container(
                    width: width*.30,
                    height:height*.10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.greyColorr),
                    ),child: Center(child: Text('Price Paid : \$50',style: TextStyle(fontWeight: FontWeight.bold),)),),
                ],),
                Container(height: height
                  *.40,
                color: Colors.transparent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fetchViewLessonModellList.length,
                    itemBuilder: (context, index) {
                      return customWidget(
                          height: height,
                          width: width,
                          videoTitle:
                          fetchViewLessonModellList[index].videoTitle,
                          videosubTitle: fetchViewLessonModellList[index]
                              .videoSubTitle,
                          imagePath:
                          fetchViewLessonModellList[index].ImagePath);
                    },
                  ),
                )
              ],),
            ),
            ))
      ],),
    );
  }
  Widget customWidget(
      {double? height,
        double? width,
        String? videoTitle,
        String? videosubTitle,
        String? imagePath}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height! * .20,
        width: width! * .20,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: width! * .20,
                child: Center(
                  child: Icon(
                    Icons.play_circle,
                    size: 40,
                    color: Constants.greyColorr,
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        //height:height!*.15,
                        imagePath!,
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                videoTitle!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

