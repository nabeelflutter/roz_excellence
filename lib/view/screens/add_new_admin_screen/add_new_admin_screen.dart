import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/view_lesson_list/view_lesson_list.dart';
import '../../widget/textfields.dart';
class AddNewAdminScreen extends StatefulWidget {
  const AddNewAdminScreen({super.key});

  @override
  State<AddNewAdminScreen> createState() => _AddNewAdminScreenState();
}

class _AddNewAdminScreenState extends State<AddNewAdminScreen> {
  TextEditingController emainController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectRoll;
  List listRoll = ['Admin','Editor'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(

        actions: [Container(
          margin: EdgeInsets.all(5),
          height: 40,
          width: 110,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Constants.darkPink.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
                'Done',
                style: GoogleFonts.playfairDisplay().copyWith(
                    color: Constants.darkPink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ),],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Constants.wightColor,
            )),
        title: Text(
          'Add new Admin or editor',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: Row(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: Container(color: Colors.transparent,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height:height*.50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.greyColorr),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/course.webp',
                              ),
                              fit: BoxFit.fill
                          )
                      ),),
                  ],),
              ),
            )),
        Expanded(
            flex: 6,
            child: Container(color: Colors.transparent,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  CustomTextField(
                      readOnly: false,
                      validator: (value) {},
                      textEditingController: nameController,
                      textColor: Colors.black,
                      MediaQuery.of(context).size.width*.50,
                      'Enter Your Name'),
                  CustomTextField(
                      readOnly: false,
                      validator: (value) {},
                      textEditingController: emainController,
                      textColor: Colors.black,
                      MediaQuery.of(context).size.width*.50,
                      'Enter Your Email'),
                  CustomTextField(
                      readOnly: false,
                      validator: (value) {},
                      textEditingController: passwordController,
                      textColor: Colors.black,
                      MediaQuery.of(context).size.width*.50,
                      'Enter Your Password'),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.08),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton(
                          hint: Text(
                            'Select Roll',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          value: selectRoll, // Set the default value
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: listRoll.map((e){
                            return DropdownMenuItem(
                              child: Text(
                                e!,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              value: e, // Ensure each item has a unique value
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              selectRoll = value!;
                            });
                          },
                          isExpanded: true,
                          underline: Container(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          dropdownColor: Colors.grey,
                          iconEnabledColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],),
              ),
            )),
      ],),
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
            Align(
              alignment: Alignment.center,
              child: Text(
                videoTitle!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

