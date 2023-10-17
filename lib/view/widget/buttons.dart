import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

Widget LoginOrSignUpPageButton(
    {String? imageUrl,
    required void Function() function,
    Color? backgroundColor,
    required double width,
    required Color color,
    required double height,
    required var buttonText,
    required Color textColor,
    required Color borderColor}) {
  return GestureDetector(
    onTap: function,
    child: Card(
      elevation: 3,
      borderOnForeground: true,
      shadowColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(color: borderColor, width: 2)),
      child: Container(
        height: height,
        width: width * 0.85,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl == null
                ? Container()
                : Center(
                    child: Image(
                    image: AssetImage("assets/"),
                  )),
            const SizedBox(
              width: 10,
            ),
           
           buttonText is String?
            Center(
                child: Text(
              buttonText,
              style: TextStyle(fontSize: 16, color: textColor),
            ))
            : buttonText
          ],
        ),
      ),
    ),
  );
}

Widget socialLoginButtons(context) {
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "facebook",
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: () async {},
          child: Image.asset('assets/images/fb_icon.png'),
        ),
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          heroTag: "linkedin",
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: () async {},
          child: Image.asset(
            'assets/images/google_icon.png',
          ),
        ),
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          heroTag: "twitter",
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: () async {},
          child: Image.asset('assets/images/apple_icon .png'),
        ),
      ],
    ),
  );
}
