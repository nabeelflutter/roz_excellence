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
          'View Editor',
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
              Align(
                alignment: Alignment.topRight,
                child: Container(height: height*.07,width: width*.10,decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  border:Border.all(color: Colors.grey)
                ),child: Center(child: Text('Delete',style: TextStyle(color: Constants.wightColor),),),),
              ),
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
                ),child: const Center(child: Text('Teacher',style: TextStyle(fontWeight: FontWeight.bold),)),),
            ],),
        ),
      ),),
    );
  }
}
