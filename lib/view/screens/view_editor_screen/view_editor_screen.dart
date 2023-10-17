import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
class ViewEditorScreen extends StatefulWidget {
  const ViewEditorScreen({super.key});

  @override
  State<ViewEditorScreen> createState() => _ViewEditorScreenState();
}

class _ViewEditorScreenState extends State<ViewEditorScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        title: Text(
          'View User',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: Center(child:  Container(
        width: width*.40,
        color: Colors.transparent,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height:height*.40,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.greyColorr),
                    image:  DecorationImage(
                        image: AssetImage(
                          'assets/images/teacher.webp',
                        ),
                        fit: BoxFit.fill
                    )
                ),),
              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child: Center(child: Text('Patrick',style: TextStyle(fontWeight: FontWeight.bold),),),),
              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child: const Center(child: Text('starling@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),),

              Container(
                height:height*.10,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyColorr),
                ),child: const Center(child: Text('Role',style: TextStyle(fontWeight: FontWeight.bold),)),),
            ],),
        ),
      ),),
    );
  }
}
