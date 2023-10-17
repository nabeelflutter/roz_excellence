import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../../static_data_lists/MessagesUsersList_list/MessagesUsersList_list.dart';
class MessageUserLists extends StatefulWidget {
  const MessageUserLists({super.key});

  @override
  State<MessageUserLists> createState() => _MessageUserListsState();
}

class _MessageUserListsState extends State<MessageUserLists> {
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
          'Messages',
          style: TextStyle(
              color: Constants.wightColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constants.wightColor),
        backgroundColor: Constants.darkPink,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
        child: ListView.builder(
          itemCount: fetdchMessagesUserList.length,
          itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, PageName.conversationScreen,arguments:fetdchMessagesUserList[index].name );
            },
            child: Card(
              color: Colors.grey,
              child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(fetdchMessagesUserList[index].imagePath),),
              title: Text(
                fetdchMessagesUserList[index].name,
              style: TextStyle(color: Constants.wightColor),
              ),
              ),
            ),
          );
        },),
      ),
    );
  }
}
