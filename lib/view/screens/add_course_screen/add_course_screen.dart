import 'package:flutter/material.dart';
import 'package:rose_excellence_admin_panel_web1/model/add_course_information_model/add_course_information_model.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:video_player/video_player.dart';
import '../../../constants/constants.dart';
import '../../../static_data_lists/add_course_list/add_course_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../edit_course_screen/edit_course_screen.dart';
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
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('Courses');

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
            child: StreamBuilder(
              stream:  collectionRef.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasError){
                return Center(child:Text('Something went wrong'));
              }
              else if(!snapshot.hasData){
                return Center(child:CircularProgressIndicator());
              }
              List<AddCourseInformationModel> models = snapshot.data!.docs.map((QueryDocumentSnapshot doc) {
                return AddCourseInformationModel.fromMap(doc.data() as Map<String, dynamic>);
              }).toList();
              return GridView.builder(
                controller: _scrollController,
                itemCount: models.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  AddCourseInformationModel model = models[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditCourseScreen(courseid: model.id,videoUrl: model.videoUrl, courseName: model.courseName, courseTitle: model.courseTitle, coursePrice: model.coursePrice, courseDuration: model.courseDuration, courseDescription: model.courseDescription,),));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        VideoPlayerScreen(videoUrl: model.videoUrl),

                        Text(
                          model.courseName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(

                          children: [
                            const Text('Enrolled Students :  '),
                            Text(
                              '0',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },)
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
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl, super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Icon(Icons.play_circle,color: Colors.white,)
        ],
      ),
    );
  }
}
