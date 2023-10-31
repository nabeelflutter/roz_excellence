
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence_admin_panel_web1/model/add_course_information_model/add_course_information_model.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/add_lesson_screen/add_lesson_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/constants.dart';
import '../../../static_data_lists/fill_lesson_lists/fill_lesson_lists.dart';
import '../view_lesson_screen/view_lesson_screen.dart';

class ViewCourseScreen extends StatefulWidget {
  String? courseId;
  String? videoUrl;
   ViewCourseScreen({super.key,  this.courseId, this.videoUrl});

  @override
  State<ViewCourseScreen> createState() => _ViewCourseScreenState();
}

class _ViewCourseScreenState extends State<ViewCourseScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoUrl.toString(),
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }


  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
         SliverToBoxAdapter(
           child: StreamBuilder(stream: FirebaseFirestore.instance.collection('Courses').doc(widget.courseId).snapshots(), builder: (context,snapshot) {
             if(snapshot.hasData){
               return Column(children: [
                AppBar(
                  title: Text(
                    snapshot.data!.data()!['courseName'],
                    style: TextStyle(
                        color: Constants.wightColor, fontWeight: FontWeight.bold),
                  ),

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
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                            isPlaying = !isPlaying;
                          });
                        },
                        child: SizedBox(
                          height: 200,
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                VideoPlayer(_controller),
                                isPlaying
                                    ? Icon(
                                  Icons.pause,
                                  size: 50,
                                  color: Colors.white,
                                )
                                    : Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
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
                              width: width * .35,
                              value: snapshot.data!.data()!['courseTitle'],
                            ),
                            customViewContainer(
                              height: height * 0.09,
                              text: 'Price :  ',
                              width: width * .35,
                              value: snapshot.data!.data()!['coursePrice']
                            ),
                            customViewContainer(
                              height: height * 0.09,
                              text: 'Duration :  ',
                              width: width * .35,
                              value: snapshot.data!.data()!['courseDuration'],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.greyColorr),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data!.data()!['courseDescription'].toString(),
                      ),
                    ),
                  ),
                ),
              ],);
            }
             else if(snapshot.hasError){
               return Center(child: Text('Something went wrong'),);
             }
             else if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
             return SizedBox();
           },),
         ),




          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.03,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .04),
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
          StreamBuilder(stream: FirebaseFirestore.instance.collection('Lessons').doc(widget.courseId).collection('LessonData').snapshots(), builder: (context, snapshot) {
            if(snapshot.hasError){
              return  SliverToBoxAdapter(
                child: Center(child: Text('Something went wrong'),)
              );
            }
            else if(!snapshot.hasData){
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator(),)
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Card(
                    color: Colors.grey,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context,
                                  PageName.viewLessonScreen,
                                arguments: ({
                                  'lessonId': snapshot.data!.docs[index]['lessonId'],
                                  'courseId': widget.courseId,
                                  'index': index,
                                  'videoId':snapshot.data!.docs[index]['videoId'],
                                })
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
                                  PageName.addLessonScreen,arguments: ({
                                'CourseId':widget.courseId,
                                'LessonId': snapshot.data!.docs[index]['lessonId'],
                                'lessonName' : snapshot.data!.docs[index]['lessonName']
                              })
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
                        snapshot.data!.docs[index]['lessonName'],
                        style: TextStyle(color: Constants.wightColor),
                      ),
                    ),
                  ),
                );
              }, childCount:snapshot.data!.docs.length),
            );
          },)
        ],
      )
    );
  }
//
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
