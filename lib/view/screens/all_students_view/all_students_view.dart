import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
class AllStudentsViewScreen extends StatefulWidget {
  const AllStudentsViewScreen({super.key});

  @override
  State<AllStudentsViewScreen> createState() => _AllStudentsViewScreenState();
}

class _AllStudentsViewScreenState extends State<AllStudentsViewScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final imagePath = ModalRoute.of(context)!.settings.arguments as String ?;

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
                             imagePath!,
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
                   ),child: const Center(child: Text('Registration Date',style: TextStyle(fontWeight: FontWeight.bold),)),),
                 Container(
                   height:height*.10,
                   decoration: BoxDecoration(
                     border: Border.all(color: Constants.greyColorr),
                   ),child: const Center(child: Text('Delete User',style: TextStyle(fontWeight: FontWeight.bold),)),),
               ],),
           ),
         ),),
    );
  }
}
