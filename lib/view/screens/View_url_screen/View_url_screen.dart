import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../constants/constants.dart';

class ViewUrlScreen extends StatelessWidget {
  ViewUrlScreen({super.key}) {
    platformViewRegistry.registerViewFactory('1', (int viewId) {
      var iframe = html.IFrameElement()
        ..src = 'https://webtune.info/';
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
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.darkPink,
        title: Text(
          'Term & Condition',
          style: TextStyle(color: Constants.wightColor),
        ),
      ),
      body: const Center(
        child: HtmlElementView(
          viewType: '1',
        ),
      ),
    );
  }
}
