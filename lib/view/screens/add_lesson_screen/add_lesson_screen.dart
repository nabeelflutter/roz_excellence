import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/constants.dart';
import '../../widget/textfields.dart';

class AddLessonScreen extends StatefulWidget {

   AddLessonScreen({super.key});

  @override
  State<AddLessonScreen> createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  TextEditingController lessonTitleController = TextEditingController();
  TextEditingController lessonSubtitleController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController videoSubtitleController = TextEditingController();
  late TextEditingController lessonDiscriptionController;
  List<Widget> addItemList = [];
  List<String> videoTitleList = [];
  bool readOnly = false;
  bool isAddItem = false;
  bool _isDisabled = false;
  final ImagePicker picker = ImagePicker();
  late VideoPlayerController _controller;
  var pickedFile;
  Uuid uuid = Uuid();
  List<dynamic> videoList = [];
  var videoUrl;
  var videoUrlPath;
  String? lessonDataId;
  UploadTask? task;
  bool isChecked = false;
  Future uploadVideo() async {
    FileUploadInputElement input = FileUploadInputElement()..accept = 'video/*';
    input.click();
    input.onChange.listen((event) {
      videoUrl = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(videoUrl);
      reader.onLoadEnd.listen((event) {
        Reference reference = FirebaseStorage.instance
            .ref()
            .child('videos/')
            .child(uuid.v4().toString());
        setState(() {
          task = reference.putBlob(videoUrl);
        });
        task!.whenComplete(() {
          reference.getDownloadURL().then((url) {
            videoUrlPath = url;
          });
          setState(() {
            isChecked = true;
            task = null;
          });
        });
      });
    });
  }

  @override
  void initState() {
    lessonDiscriptionController = TextEditingController();
    super.initState();
    _controller = VideoPlayerController.asset(pickedFile?.path ?? '')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    lessonDiscriptionController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final userdata = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic> ?;

    print('${userdata!['CourseId']}MMMMMMMMMMMMMMMMMMMMMM');
    // print('${widget.lessonId}LLLLLLLLLLLLLLLLLLLLLLLL');
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
          'Lesson Name',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            height: 40,
            width: 110,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Constants.darkPink.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              'Publish',
              style: GoogleFonts.playfairDisplay().copyWith(
                  color: Constants.darkPink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .50,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .03, vertical: height * .02),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Constants.greyColorr)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: width * .05, left: width * .03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              ' Lesson Title',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            CustomTextField(
                                                readOnly: readOnly,
                                                validator: (value) {},
                                                textEditingController:
                                                    lessonTitleController,
                                                textColor: Colors.black,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .35,
                                                'Enter Lesson Title'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Lesson Subtitle',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            CustomTextField(
                                                readOnly: readOnly,
                                                validator: (value) {},
                                                textEditingController:
                                                    lessonSubtitleController,
                                                textColor: Colors.black,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .35,
                                                'Enter Lesson Subtitle'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .02,
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      ' Lesson Discription',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      enabled: !_isDisabled,
                                      readOnly: readOnly,
                                      controller: lessonDiscriptionController,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.darkPink,
                                              width: 2,
                                              style: BorderStyle.solid),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.3))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Constants.pinkColor,
                                                width: 2)),
                                        hintText: 'Lesson Discription',
                                        hintStyle: TextStyle(
                                            color: Constants.pinkColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * .02, horizontal: width * .02),
                          child: GestureDetector(
                            onTap: () async {
                              lessonDataId = FirebaseFirestore.instance.collection('Lessons').doc().collection('LessonData').doc().id;
                              await  FirebaseFirestore.instance.collection('Lessons').doc(userdata['CourseId']).collection('LessonData').doc(userdata['LessonId']).set(
                                  {
                                    'videoId' : lessonDataId,
                                    'lessonName' : userdata['lessonName'],
                                    'courseId' : userdata['CourseId'],
                                    'lessonId' : userdata['LessonId'],
                                    'lessonTitle': lessonTitleController.text.toString(),
                                    'lessonSubTitle': lessonSubtitleController.text.toString(),
                                    'lessonDiscription': lessonDiscriptionController.text.toString()
                                  });
                              setState(() {
                                readOnly = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Constants.greyColorr),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.greyColorr),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'S',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text('U',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text('B',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text('M',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text('I',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text('T',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isAddItem
                  ? Container(
                      width: width,
                      height: height * .30,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .03),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: addItemList.length,
                          itemBuilder: (context, index) {
                            return addItemList[index];
                          },
                        ),
                      ),
                    )
                  : SizedBox(),
              Container(
                height: height * .50,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .03, vertical: height * .02),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Constants.greyColorr)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: width * .05, left: width * .03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              ' Video Title',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            CustomTextField(
                                                readOnly: false,
                                                validator: (value) {},
                                                textEditingController:
                                                    videoTitleController,
                                                textColor: Colors.black,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .35,
                                                'Enter Video Title'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Video Subtitle',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            CustomTextField(
                                                readOnly: false,
                                                validator: (value) {},
                                                textEditingController:
                                                    videoSubtitleController,
                                                textColor: Colors.black,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .35,
                                                'Enter Video Subtitle'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * .25,
                                        width: width * .32,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  uploadVideo();
                                                },
                                                child: Container(
                                                  // height: height * .25,
                                                  decoration:
                                                  const BoxDecoration(color: Colors.grey),
                                                  width: width * .10,
                                                  child:  Center(
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        isChecked == true ?Icon(Icons.done,color: Colors.white,size: 60,):Icon(Icons.add),
                                                        buildProgress()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width*.20,
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  // alignment: Alignment.center,
                                                  children: [
                                                    _controller.value
                                                            .isInitialized
                                                        ? AspectRatio(
                                                            aspectRatio:
                                                                _controller
                                                                    .value
                                                                    .aspectRatio,
                                                            child: VideoPlayer(
                                                                _controller),
                                                          )
                                                        : Container(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _controller.value
                                                                  .isPlaying
                                                              ? _controller
                                                                  .pause()
                                                              : _controller
                                                                  .play();
                                                        });
                                                      },
                                                      child: Icon(
                                                        _controller.value
                                                                .isPlaying
                                                            ? Icons.pause
                                                            : Icons
                                                                .play_arrow,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * .02, horizontal: width * .02),
                          child: GestureDetector(
                            onTap: () async {
                              String videoId = FirebaseFirestore.instance.collection('videos').doc().id;
                              await FirebaseFirestore.instance.collection('videos').doc(videoId).set({
                                'courseId': userdata['CourseId'],
                                'videoId':videoId,
                                'lessonId': userdata['LessonId'],
                                'lessonName': userdata['lessonName'],
                                'lessonDataId':lessonDataId,
                                'videoTitle': videoTitleController.text.toString(),
                                'videoSubTitle': videoSubtitleController.text.toString(),
                                'videoUrl': videoUrlPath.toString(),
                              }).whenComplete(() {
                                isAddItem = true;
                                setState(() {
                                  videoTitleList
                                      .add(videoTitleController.text.toString());
                                  videoList.add(pickedFile);
                                  addItemList.add(customWidget(
                                    controller: _controller,
                                      width: width,
                                      height: height,
                                      videoTitle: videoTitleController.text,
                                      aspect: _controller.value.aspectRatio,
                                      videoSubTitle: videoSubtitleController.text));
                                  videoSubtitleController.clear();
                                  videoTitleController.clear();
                                  isChecked = false;
                                });
                              });

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Constants.greyColorr),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.greyColorr),
                              child:task == null?const Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'S',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text('U',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text('B',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text('M',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text('I',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text('T',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ],
                                ),
                              ): Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget buildProgress() {
    if (task != null) {
      return StreamBuilder<TaskSnapshot>(
        stream: task!.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            double progress = data!.bytesTransferred / data.totalBytes;
            return Center(child: CircularProgressIndicator(value: progress,color: Colors.white,));
          } else {
            return SizedBox();
          }
        },
      );
    } else {
      return SizedBox();
    }
  }

  Widget customWidget(
      {double? height,
      double? width,
      String? videoTitle,
      String? videoSubTitle, required aspect,required controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: height! * .20,
        // width: width! * .20,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio:
                    aspect,
                    child: VideoPlayer(
                        controller),
                  ),
                  Icon(Icons.play_circle,color: Colors.white,)
                ],
              ),
            ),
            SizedBox(
              height: height! * .01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width! * .003),
              child: Text(
                videoTitle!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .003),
              child: Text(
                videoSubTitle!,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
