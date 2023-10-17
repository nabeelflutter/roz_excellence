
//S
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/add_course_screen/add_course_screen.dart';

import '../../../constants/constants.dart';
import '../../../static_data_lists/fill_lesson_lists/fill_lesson_lists.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
     final courseName = ModalRoute.of(context)!.settings.arguments as String ?;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(courseName.toString(),style: TextStyle(color: Constants.wightColor,fontWeight: FontWeight.bold),),
            pinned: true,
            backgroundColor: Constants.darkPink,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Constants.wightColor,
              ),

            ),
            iconTheme: IconThemeData(color: Constants.wightColor),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Constants.darkPink.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: GoogleFonts.playfairDisplay().copyWith(
                      color: Constants.darkPink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.05),
                    child: Container(
                      child: Center(child: Icon(Icons.play_circle,size: 40,color: Constants.greyColorr,),),
                      height: height*.35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Constants.greyColorr),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/teacher.webp',
                            ),fit: BoxFit.fill),),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03, vertical: height * 0.02),
                  child: SizedBox(
                    height: height * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customViewContainer(
                          height: height * 0.09,
                          text: 'Title :  ',
                          width: width*.35,
                          value: ' Flutter',
                        ),
                        customViewContainer(
                          height: height * 0.09,
                          text: 'Price :  ',
                          width: width*.35,
                          value: " \$5",
                        ),
                        customViewContainer(
                          height: height * 0.09,
                          text: 'Duration :  ',
                          width: width*.35,
                          value: ' 10 days',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.03,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.04),
              child: const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.01,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.03,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.04),
              child: const Text(
                'Lessons',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.01,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Card(
                    color: Colors.grey,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pushNamed(
                                context,
                                PageName.viewLessonScreen,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: Constants.darkPink,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Open',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PageName.addLessonScreen,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: Constants.darkPink,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Add Content',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      leading: fetchFillLessonList[index].icon,
                      title: Text(
                        fetchFillLessonList[index].bookName,
                        style: TextStyle(color: Constants.wightColor),
                      ),
                    ),
                  ),
                );
              },
              childCount: fetchFillLessonList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget customViewContainer(
      {double? height, double? width, String? text, String? value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Constants.greyColorr),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                value!,
                style: TextStyle(color: Constants.greyColorr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
