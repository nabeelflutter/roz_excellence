import 'package:flutter/material.dart';
import 'package:rose_excellence_admin_panel_web1/static_data_lists/assignments_lists/assignments_list.dart';

import '../../../constants/constants.dart';
class ViewAssignmentsScreen extends StatefulWidget {
  const ViewAssignmentsScreen({super.key});

  @override
  State<ViewAssignmentsScreen> createState() => _ViewAssignmentsScreenState();
}

class _ViewAssignmentsScreenState extends State<ViewAssignmentsScreen> {
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
          'View User',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: Center(child:  Container(
        width: width*.40,
        color: Colors.transparent,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height:height*.40,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.greyColorr),
                    image:  DecorationImage(
                        image: AssetImage(
                          fetchAssignmentsList[0].imagePath.toString() ,
                        ),
                        fit: BoxFit.fill
                    )
                ),),
              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child: Center(child: Text(fetchAssignmentsList[0].userName,style: TextStyle(fontWeight: FontWeight.bold),),),),
              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child:  Center(child: Text(fetchAssignmentsList[0].courseName,style: TextStyle(fontWeight: FontWeight.bold),)),),

              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child:  Center(child: Text(fetchAssignmentsList[0].assignmentTitle,style: TextStyle(fontWeight: FontWeight.bold),)),),
            ],),
        ),
      ),),
    );
  }
}
