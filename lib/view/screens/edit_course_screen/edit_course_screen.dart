//S
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence_admin_panel_web1/model/add_course_information_model/add_course_information_model.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/add_course_screen/add_course_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/constants.dart';
import '../../../static_data_lists/fill_lesson_lists/fill_lesson_lists.dart';

class EditCourseScreen extends StatefulWidget {
  String? videoUrl = '';
  String? courseid= '';
  String? courseName= '';
  String? courseTitle= '';
  String? coursePrice= '';
  String? courseDuration= '';
  String? courseDescription= '';
   EditCourseScreen({super.key, this.videoUrl,  this.courseid,  this.courseName,  this.courseTitle,  this.coursePrice,  this.courseDuration,  this.courseDescription});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  late Future<void> _initializeVideoPlayerFuture;
  List<dynamic> lessonArray = [];
  @override
  void initState() {
    super.initState();
    _getArrayItems();
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

  Future<void> _getArrayItems() async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection('Lessons').doc(widget.courseid).get();
      lessonArray = List.from(document['lessons']);
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
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

    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Lessons');
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              widget.courseName.toString(),
              style: TextStyle(
                  color: Constants.wightColor, fontWeight: FontWeight.bold),
            ),
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
                          value: widget.courseTitle,
                        ),
                        customViewContainer(
                          height: height * 0.09,
                          text: 'Price :  ',
                          width: width * .35,
                          value: widget.coursePrice,
                        ),
                        customViewContainer(
                          height: height * 0.09,
                          text: 'Duration :  ',
                          width: width * .35,
                          value: widget.courseDuration,
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
              padding: EdgeInsets.symmetric(horizontal: width * .04),
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
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.courseDescription.toString(),
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
          StreamBuilder(stream: FirebaseFirestore.instance.collection('Lessons').snapshots(), builder: (context, snapshot) {
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
                        lessonArray[index],
                        style: TextStyle(color: Constants.wightColor),
                      ),
                    ),
                  ),
                );
              }, childCount:lessonArray.length ),
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
