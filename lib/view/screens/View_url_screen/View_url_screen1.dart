
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../constants/constants.dart';
class ViewUrlScreen1 extends StatelessWidget {

  ViewUrlScreen1() {
    platformViewRegistry.registerViewFactory('2', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://floridaindians.com/privacy_policy.html';
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        backgroundColor: Constants.darkPink,
        title: Text('Privacy',style: TextStyle(color: Constants.wightColor),),),
      body: Container(
          width:  double.infinity, height: double.infinity, child: HtmlElementView(viewType: '2')),
    );
  }
}