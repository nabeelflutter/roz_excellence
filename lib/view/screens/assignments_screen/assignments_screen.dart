import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/add_course_list/add_course_list.dart';
import '../../../static_data_lists/assignments_lists/assignments_list.dart';
class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
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
        centerTitle: true,
        backgroundColor: Constants.darkPink,
        elevation: 0,title: Text('Assingments',style: TextStyle(color: Constants.wightColor),),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * .03, horizontal: width * .05),
          child: GridView.builder(
            itemCount: fetchAssignmentsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageName.viewAssignmentsScreen,
                     );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: height * .30,
                      width: width * .20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              fetchListOfModel[index].imagePath,
                            ),
                            fit: BoxFit.fill,
                          )),
                      child: Container(
                        height: height*.08,
                        color: Colors.grey.withOpacity(0.7),
                        child: Center(child:   Text(
                          fetchAssignmentsList[index].userName,
                          style:  TextStyle(fontWeight: FontWeight.bold,color: Constants.wightColor),
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      fetchAssignmentsList[index].courseName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      fetchAssignmentsList[index].assignmentTitle.toString(),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
