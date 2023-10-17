//
// import 'package:flutter/material.dart';
// import 'package:webviewx/webviewx.dart';
// import 'dart:ui_web';
// class We extends StatefulWidget {
//   const We({super.key});
//
//   @override
//   State<We> createState() => _WeState();
// }
//
// class _WeState extends State<We> {
//   late WebViewXController webviewController;
//    @override
//   void initState() {
//     super.initState();
//     webviewController = WebViewXController(
//         initialContent: 'Loding...', initialSourceType: SourceType.URL, ignoreAllGestures: true);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: WebViewX(
//           width: 500,
//           height: 500,
//           onWebViewCreated: (controller) => webviewController = controller,
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'constants/constants.dart';
class We extends StatelessWidget {
  We() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://www.africau.edu/';
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
        title: Text('Url',style: TextStyle(color: Constants.wightColor),),),
      body: Container(
          width:  double.infinity, height: double.infinity, child: HtmlElementView(viewType: 'iframe')),
    );
  }
}