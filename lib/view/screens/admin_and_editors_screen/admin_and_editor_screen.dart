import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/add_course_list/add_course_list.dart';
import '../../../static_data_lists/enrolled_student_list/enrolled_student_list.dart';

class AdminAndEdotorScreen extends StatefulWidget {
  const AdminAndEdotorScreen({super.key});

  @override
  State<AdminAndEdotorScreen> createState() => _AdminAndEdotorScreenState();
}

class _AdminAndEdotorScreenState extends State<AdminAndEdotorScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
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
            'Admin & Editors',
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
              controller: _scrollController,
              itemCount: fetchTeacherList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, PageName.viewEditorScreen,
                    );
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
                            fetchTeacherList[index].imagePath,
                          ),
                          fit: BoxFit.fill,
                        )),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                    Padding(
                      padding:  EdgeInsets.only(right: width*.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            'Name',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            'Jon',
                            style: const TextStyle(
                            ),
                          ),
                        ],
                      ),
                    ),
                      Padding(
                        padding:  EdgeInsets.only(right: width*.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              'Email',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              'Jon123@gmail.com',
                              style: const TextStyle(
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .003,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teacher',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .05),
                            child: Text(
                           '01/04/2023',
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
        ),
      floatingActionButton: ScrollingFabAnimated(
      color: Constants.darkPink,
      width: 150,
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      text: Text(
        'Add Roll',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      onPress: () {
        Navigator.pushNamed(context, PageName.addNewAdminScreen);
      },
      scrollController: _scrollController,
      animateIcon: true,
      inverted: false,
    ));

  }
}
