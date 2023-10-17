import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/view_lesson_list/view_lesson_list.dart';
import '../../widget/textfields.dart';

class ViewLessonScreen extends StatefulWidget {
  const ViewLessonScreen({super.key});

  @override
  State<ViewLessonScreen> createState() => _ViewLessonScreenState();
}

class _ViewLessonScreenState extends State<ViewLessonScreen> {
  TextEditingController lessonTitleController = TextEditingController();
  TextEditingController lessonSubtitleController = TextEditingController();
  TextEditingController lessonDiscriptionController = TextEditingController();

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
          'Lesson Name',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        ' Lesson Title',
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
                          ' Flutter'),
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
                          'Widgets'),
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
                          'Nam commodo sapien dolor, et bibendum dolor lobortis vitae. Ut vulputate finibus nunc at malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu est quis risus faucibus ornare eu id arcu. Nam ullamcorper dui quis erat faucibus ultricies. Fusce porttitor, tortor sed sodales auctor, leo justo blandit tortor, nec cursus est dui quis risus. Etiam accumsan consequat justo non viverra. Donec maximus, nibh vitae pharetra mattis, metus justo dapibus velit, id finibus mi eros non tortor. Sed fermentum urna blandit nunc fringilla imperdiet. Sed eget enim at leo lacinia viverra. Vivamus porttitor accumsan ex nec porta. Donec urna sem, tempus eget lacus ac, vehicula imperdiet ex.Nam commodo sapien dolor, et bibendum dolor lobortis vitae. Ut vulputate finibus nunc at malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu est quis risus faucibus ornare eu id arcu. Nam ullamcorper dui quis erat faucibus ultricies. Fusce porttitor, tortor sed sodales auctor, leo justo blandit tortor, nec cursus est dui quis risus. Etiam accumsan consequat justo non viverra. Donec maximus, nibh vitae pharetra mattis, metus justo dapibus velit, id finibus mi eros non tortor. Sed fermentum urna blandit nunc fringilla imperdiet. Sed eget enim at leo lacinia viverra. Vivamus porttitor accumsan ex nec porta. Donec urna sem, tempus eget lacus ac, vehicula imperdiet ex.'),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .05, vertical: height * .02),
                child: Container(
                  height: height * .25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fetchViewLessonModellList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageName.playVideoScreen,
                                arguments:
                                    fetchViewLessonModellList[index].ImagePath);
                          },
                          child: customWidget(
                              height: height,
                              width: width,
                              videoTitle:
                                  fetchViewLessonModellList[index].videoTitle,
                              videosubTitle: fetchViewLessonModellList[index]
                                  .videoSubTitle,
                              imagePath:
                                  fetchViewLessonModellList[index].ImagePath));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customWidget(
      {double? height,
      double? width,
      String? videoTitle,
      String? videosubTitle,
      String? imagePath}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height! * .20,
        width: width! * .20,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: width! * .20,
                child: Center(
                  child: Icon(
                    Icons.play_circle,
                    size: 40,
                    color: Constants.greyColorr,
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    //height:height!*.15,

                    imagePath!,
                  ),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .01),
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
        ),
      ),
    );
  }
}
