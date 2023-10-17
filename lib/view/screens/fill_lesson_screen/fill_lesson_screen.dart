import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:rose_excellence_admin_panel_web1/static_data_lists/fill_lesson_lists/fill_lesson_lists.dart';

import '../../../constants/constants.dart';

class FillLessonScreen extends StatefulWidget {
  const FillLessonScreen({super.key});

  @override
  State<FillLessonScreen> createState() => _FillLessonScreenState();
}

class _FillLessonScreenState extends State<FillLessonScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
          title: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/m_logo.png',
              )),
          centerTitle: true,
          iconTheme: IconThemeData(color: Constants.wightColor),
          backgroundColor: Constants.darkPink,
        ),
        body: SafeArea(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: fetchFillLessonList.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.pink.shade200,
                child: ListTile(
                  subtitle: Text(fetchFillLessonList[index].lessonTitle,style: TextStyle(color: Constants.wightColor),),
                  trailing: fetchFillLessonList[index].icon,
                  title: Text(fetchFillLessonList[index].bookName,style: TextStyle(color: Constants.wightColor)),
                ),
              ),
            );
          },),
        ),
        floatingActionButton: ScrollingFabAnimated(
          color: Constants.darkPink,
          width: 150,
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          text: Text(
            'Fill Lesson',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          onPress: () {
            // Navigator.pushNamed(context, PageName.addCourseScreen);
          },
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
        )
    );
  }
}
