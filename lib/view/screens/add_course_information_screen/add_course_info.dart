import 'dart:convert';
import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../constants/constants.dart';
import '../../../model/add_course_information_model/add_course_information_model.dart';
import '../../widget/textfields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCourseInformationScreen extends StatefulWidget {
  const AddCourseInformationScreen({super.key});

  @override
  State<AddCourseInformationScreen> createState() =>
      _AddCourseInformationScreenState();
}

class _AddCourseInformationScreenState
    extends State<AddCourseInformationScreen> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseTitleController = TextEditingController();
  TextEditingController coursePriceController = TextEditingController();
  TextEditingController courseDiscriptionController = TextEditingController();
  TextEditingController courseDurationController = TextEditingController();
  List<TextEditingController> addLeasonControllerList = [];
  List<TextEditingController> subCategoryControllers = [];
  List<Widget> subCategoryFields = [];
  late TextEditingController categoryController;
  late TextEditingController subcategoryTitle;
  late VideoPlayerController _controller;
  Uuid uuid = Uuid();
  var videoUrlPath;
  var videoUrl;
  bool isChecked = false;
  UploadTask? task;
  String? videoPath;
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
    print('$videoUrl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    categoryController = TextEditingController();
    subcategoryTitle = TextEditingController();
    super.initState();
    _controller = VideoPlayerController.asset(videoUrlPath?.path ?? '')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    categoryController.dispose();
    subcategoryTitle.dispose();
    for (final controller in subCategoryControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> addCourseInformationToFirebase(
      AddCourseInformationModel addCourseInformationModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('Courses')
        .add(addCourseInformationModel.toMap());
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
        actions: [
          InkWell(
            onTap: () async {
              if(isChecked){
                String courseId=FirebaseFirestore.instance.collection('Courses').doc().id;
                await FirebaseFirestore.instance.collection('Courses').doc(courseId).set({
                  'courseId': courseId,
                  'courseName': courseNameController.text,
                  'courseTitle': courseTitleController.text,
                  'coursePrice': coursePriceController.text,
                  'courseDescription': courseDiscriptionController.text,
                  'videoUrl': videoUrlPath.toString(),
                  'courseDuration': courseDurationController.text
                });
                Future.forEach(subCategoryControllers, (element) async {
                  String lessonId=FirebaseFirestore.instance.collection('Lessons').doc().id;
                  await  FirebaseFirestore.instance.collection('Lessons').doc(courseId).collection('LessonData').doc(lessonId).set(
                      {
                        'lessonName' : element.text,
                        'courseId' : courseId,
                        'lessonId' : lessonId
                      });
                });
                Navigator.pop(context);
              }
            },



            child: Container(
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
                  child: task == null?Text(
                'Done',
                style: GoogleFonts.playfairDisplay().copyWith(
                    color: Constants.darkPink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ):CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * .01,
              ),
              CustomTextField(
                  readOnly: false,
                  validator: (value) {},
                  textEditingController: courseNameController,
                  textColor: Colors.black,
                  MediaQuery.of(context).size.width * .95,
                  'Enter your Course Name'),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: EdgeInsets.only(right: width * .05, left: width * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Course Title',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        CustomTextField(
                            readOnly: false,
                            validator: (value) {},
                            textEditingController: courseTitleController,
                            textColor: Colors.black,
                            MediaQuery.of(context).size.width * .35,
                            'Enter Course title'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Course Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        CustomTextField(
                            readOnly: false,
                            validator: (value) {},
                            textEditingController: coursePriceController,
                            textColor: Colors.black,
                            MediaQuery.of(context).size.width * .35,
                            'Enter Course price'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              const Text(
                'Course Discription',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: courseDiscriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constants.darkPink,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.3))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Constants.pinkColor, width: 2)),
                    hintText: 'Course Discription',
                    hintStyle: TextStyle(color: Constants.pinkColor),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              const Text(
                'Add Intro Video',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: height * .25,
                          width: width * .32,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: height * .25,
                    width: width * .35,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.greyColorr)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                            readOnly: false,
                            validator: (value) {},
                            textEditingController: courseDurationController,
                            textColor: Colors.black,
                            MediaQuery.of(context).size.width * .35,
                            'Enter Duration'),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: width * .20,
                              height: height * .09,
                              child: _addFieldsButton()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 500,
                width: width,
                child: ListView.builder(
                  itemCount: subCategoryControllers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height * .02),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {},
                            child: subCategoryFields[index],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addFieldsButton() {
    IconData icon = Icons.edit;
    bool isEnbled = true;
    return ListTile(
      title: Container(
        height: 120,
        width: 200,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Constants.darkPink,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Center(
            child: Text(
          'Add Lesson',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        )),
      ),
      onTap: () {
        final subCategoryNameController = TextEditingController();
        final subCategoryField = Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTextField(
            readOnly: false,
            isEnebled: isEnbled,
            suffix: GestureDetector(
                onTap: () {
                  print('>>>>>>>>>>>>>>>');
                  setState(() {
                    if (icon == Icons.edit) {
                      isEnbled = true;
                      icon = Icons.done;
                    } else {
                      isEnbled = false;
                      icon = Icons.edit;
                    }
                  });
                },
                child: Icon(icon)),
            validator: (value) {},
            textEditingController: subCategoryNameController,
            textColor: Colors.black,
            MediaQuery.of(context).size.width,
            'Lesson Name',
          ),
        );

        setState(() {
          subCategoryControllers.add(subCategoryNameController);
          subCategoryFields.add(subCategoryField);
        });
      },
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
