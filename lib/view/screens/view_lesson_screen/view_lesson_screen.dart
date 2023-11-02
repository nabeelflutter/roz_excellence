import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/view_lesson_list/view_lesson_list.dart';
import '../../widget/textfields.dart';
import '../play_video_screen/play_video_screen.dart';

class ViewLessonScreen extends StatefulWidget {
  ViewLessonScreen({
    super.key,
  });

  @override
  State<ViewLessonScreen> createState() => _ViewLessonScreenState();
}

class _ViewLessonScreenState extends State<ViewLessonScreen> {
  TextEditingController? lessonTitleController;
  TextEditingController? lessonSubtitleController;
  TextEditingController? lessonDiscriptionController;

  bool isShowAllVideo = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lessonTitleController = TextEditingController();
    lessonSubtitleController = TextEditingController();
    lessonDiscriptionController = TextEditingController();
  }
  @override
  void dispose() {
    lessonTitleController!.dispose();
    lessonSubtitleController!.dispose();
    lessonDiscriptionController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
            arguments['lessonName'],
            style: TextStyle(
                color: Constants.wightColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Constants.wightColor),
          backgroundColor: Constants.darkPink,
        ),
        body:SafeArea(
          child:StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Lessons').doc(arguments['courseId']).collection('LessonData').doc(arguments['lessonId']).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Title',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                CustomTextField(
                                  readOnly: true,
                                  validator: (value) {},
                                  textEditingController: lessonTitleController,
                                  textColor: Colors.black,
                                  MediaQuery.of(context).size.width * .35,
                                  snapshot.data!.data()!['lessonTitle'].toString(),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Lesson Subtitle',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                CustomTextField(
                                    readOnly: true,
                                    validator: (value) {},
                                    textEditingController: lessonSubtitleController,
                                    textColor: Colors.black,
                                    MediaQuery.of(context).size.width * .35,
                                  snapshot.data!.data()!['lessonSubTitle'].toString()),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * .05, vertical: height * .02),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              'Lesson Discription',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .05,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Constants.greyColorr)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data!.data()!['lessonDescription'].toString(),),
                              ),
                            )),
                        SizedBox(height: 30,),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            isShowAllVideo = true;
                          });
                        }, child: Text('View All videos')),
                        isShowAllVideo == true? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * .05, vertical: height * .02),
                          child: Container(
                            height: height * .40,
                            child: StreamBuilder(
                                stream:  FirebaseFirestore.instance
                                    .collection('Videos').doc(arguments['lessonId']).collection('Videos').snapshots(),
                                builder: (context, snapshot) {
                                  if(!snapshot.hasData){
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                  else if(snapshot.hasError){
                                    return Center(child: Text('Some thing wentwrong'),);
                                  }
                                  else if(snapshot.hasData){
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              // Navigator.pushNamed(
                                              //     context, PageName.playVideoScreen,
                                              //     arguments:
                                              //         fetchViewLessonModellList[index].ImagePath);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PlayVideoScreen(
                                                      videoSubTitle:
                                                      snapshot.data!.docs[index]['videoSubTitle'],
                                                      videoTitle:
                                                      snapshot.data!.docs[index]['videoTitle'],
                                                      videoPath: snapshot.data!.docs[index]['videoUrl'],
                                                    ),
                                                  ));
                                            },
                                            child: customWidget(
                                              height: height,
                                              index: index,
                                              width: width,
                                              videoTitle:
                                              snapshot.data!.docs[index]['videoTitle'],
                                              videosubTitle: snapshot.data!.docs[index]['videoSubTitle'],
                                              videoUrl:  snapshot.data!.docs[index]['videoUrl'],
                                            )
                                        );
                                      },
                                    );
                                  }
                                  return SizedBox();
                                }
                            ),
                          ),
                        ):
                        SizedBox()
                      ],
                    ),

                  );
                }

                else if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text('Something went wrong'),);
                }
                return SizedBox();
              }

          )
        )

        );
  }

  Widget customWidget(
      {double? height,
      double? width,
      String? videoTitle,
      String? videosubTitle,
      var index,
      String? videoUrl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: VideoPlayerScreen(videoUrl: videoUrl.toString()),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * .01),
          child: Text(
            videoTitle!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .01),
          child: Text(
            videosubTitle!,
            style: TextStyle(color: Colors.grey.shade500),
          ),
        )
      ],
    );
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
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Icon(
            Icons.play_circle,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
