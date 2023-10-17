import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

Widget CustomTextField(
    double width,
    String hint,
    {Color? textColor,
      var validator,
      bool? isEnebled,
      var readOnly,
      var prefix,
    bool? isObscure,
    Widget? suffix,
    Color? backgroundColor,
    TextEditingController?
        textEditingController} /*,{ String? prefixIconUrl, String? suffixIconUrl}*/) {
  TextEditingController textEditingControllerr = TextEditingController();
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: width * 0.95,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor == null ? Colors.white : backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          readOnly: readOnly,
          enabled: isEnebled,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: isObscure ?? false,
            style:
                TextStyle(color: textColor == null ? Colors.white : textColor),
            controller: textEditingController != null
                ? textEditingController
                : textEditingControllerr,
            decoration: InputDecoration(
                /*prefixIcon: prefixIconUrl==null? Container() : Image(image: AssetImage(prefixIconUrl),),
              suffixIcon: suffixIconUrl==null? Container() :Image(image: AssetImage(suffixIconUrl),),*/
                hintText: hint,
                suffixIcon: suffix,
                prefixIcon: prefix,
                hintStyle: TextStyle(color: Constants.pinkColor),
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
                        BorderSide(color: Constants.pinkColor, width: 2)
                )
            )
        ),
      ));
}
Widget TextAreaa(double width, String hint,
    {Color? textColor,
      Color? backgroundColor,
      TextEditingController?
      textEditingController} /*,{ String? prefixIconUrl, String? suffixIconUrl}*/) {
  TextEditingController textEditingControllerr = TextEditingController();
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: width * 0.95,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor == null ? Colors.white : backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          maxLines: 4,

            style:
            TextStyle(color: textColor == null ? Colors.white : textColor),
            controller: textEditingController != null
                ? textEditingController
                : textEditingControllerr,
            decoration: InputDecoration(
              /*prefixIcon: prefixIconUrl==null? Container() : Image(image: AssetImage(prefixIconUrl),),
              suffixIcon: suffixIconUrl==null? Container() :Image(image: AssetImage(suffixIconUrl),),*/
                hintText: hint,
                hintStyle: TextStyle(color: Constants.orrangeColorr),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constants.pinkColor,
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
                    BorderSide(color: Constants.pinkColor, width: 2)))),
      ));
}