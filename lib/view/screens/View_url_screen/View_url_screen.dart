
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../constants/constants.dart';
import '../../../model/ViewUrlModel/View_url_model.dart';
class ViewUrlScreen extends StatelessWidget {
  ViewUrlModel? _viewUrlModel;

  ViewUrlScreen() {
    platformViewRegistry.registerViewFactory('1', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = _viewUrlModel!.url;
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    _viewUrlModel = ModalRoute.of(context)!.settings.arguments as ViewUrlModel ?;
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
        title: Text(_viewUrlModel!.title.toString(),style: TextStyle(color: Constants.wightColor),),),
      body: Container(
          width:  double.infinity, height: double.infinity, child: HtmlElementView(viewType: '1')),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:webviewx/webviewx.dart';
// import '../../../constants/constants.dart';
//
// class ViewUrlScreen extends StatefulWidget {
//   const ViewUrlScreen({super.key});
//
//   @override
//   State<ViewUrlScreen> createState() => _ViewUrlScreenState();
// }
//
// class _ViewUrlScreenState extends State<ViewUrlScreen> {
//   late WebViewXController webviewController;
//
//   @override
//   void initState() {
//     super.initState();
//     webviewController = WebViewXController(initialContent: 'loading...', initialSourceType: SourceType.URL, ignoreAllGestures: true)
//       ..loadContent('https://flutter.dev', SourceType.URL);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Constants.wightColor,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Constants.darkPink,
//         title: Text(
//           'a',
//           style: TextStyle(color: Constants.wightColor),
//         ),
//       ),
//       body: WebViewX(
//         onWebViewCreated: (controller) => webviewController,
//       ),
//     );
//   }
// }

//