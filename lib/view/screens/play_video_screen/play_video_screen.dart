import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({super.key});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final imagePath = ModalRoute.of(context)!.settings.arguments as String ;
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
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          flex: 8,
          child: Container(
            child: Center(child: Icon(Icons.play_circle,size: 40,color: Constants.greyColorr,),),

            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fill)),
          ),
        ),
      Expanded(
          flex: 2,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        Text('Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        Text('Sub Title',style: TextStyle(color: Colors.grey.shade500,fontSize: 20),)
      ],),
          ))
      ],),),
    );
  }
}
