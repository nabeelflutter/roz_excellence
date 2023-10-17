import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/add_course_list/add_course_list.dart';
import '../../../static_data_lists/all_students_list/all_students_list.dart';
import '../../../static_data_lists/enrolled_student_list/enrolled_student_list.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            'All Users',
            style: TextStyle(
                color: Constants.wightColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Constants.wightColor),
          backgroundColor: Constants.darkPink,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * .03, horizontal: width * .03),
            child: GridView.builder(
              itemCount: fetchListOfModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageName.allStudentsViewScreen,
                        arguments: fetchAllStudentsList[index].imagePath);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * .30,
                        width: width * .20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                fetchAllStudentsList[index].imagePath,
                              ),
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        fetchAllStudentsList[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      SizedBox(height: height*.003,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( fetchAllStudentsList[index].registration.toString()  ,style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: width*.02,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*.05),
                            child: Text(
                              fetchAllStudentsList[index].date.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
