import 'package:flutter/material.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import '../../../constants/constants.dart';
import '../../../static_data_lists/add_course_list/add_course_list.dart';

class AddCoursesScreen extends StatefulWidget {
  const AddCoursesScreen({super.key});

  @override
  State<AddCoursesScreen> createState() => _AddCoursesScreenState();
}

class _AddCoursesScreenState extends State<AddCoursesScreen> {
  final ScrollController _scrollController = ScrollController();

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
          title: const CircleAvatar(
              backgroundImage: AssetImage(
            'assets/images/m_logo.png',
          )),
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
              itemCount: fetchListOfModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageName.editCourseScreen,
                        arguments: fetchListOfModel[index].courseName);
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
                            fetchListOfModel[index].imagePath,
                          ),
                          fit: BoxFit.fill,
                        )),
                        child: Center(
                          child: Icon(
                            Icons.play_circle,
                            size: 40,
                            color: Constants.greyColorr,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Center(
                        child: Text(
                          fetchListOfModel[index].courseName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Enrolled Students :  '),
                          Text(
                            fetchListOfModel[index].enrolledStudents.toString(),
                            style: const TextStyle(color: Colors.grey),
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
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          text: const Text(
            'Add Course',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          onPress: () {
            Navigator.pushNamed(context, PageName.addCourseInformationScreen);
          },
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
        ));
  }
}
