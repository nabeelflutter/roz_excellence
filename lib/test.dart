import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailList extends StatefulWidget {
  @override
  _VideoThumbnailListState createState() => _VideoThumbnailListState();
}

class _VideoThumbnailListState extends State<VideoThumbnailList> {
  List<String> videoPaths = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", // Replace with your video file paths
  ];

  Future<String?> getThumbnail(String videoPath) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      imageFormat: ImageFormat.PNG,
      maxHeight: 100,
      quality: 25,
    );
    return thumbnailPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Thumbnails"),
      ),
      body: ListView.builder(
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return FutureBuilder<String?>(
            future: getThumbnail(videoPaths[index]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                   snapshot.data.toString(),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
//
// class Thumb1 extends StatefulWidget {
//   const Thumb1({Key? key}) : super(key: key);
//
//   @override
//   State<Thumb1> createState() => _Thumb1State();
// }
//
// class _Thumb1State extends State<Thumb1> {
//   String? _thumbnailUrl;
//
//   @override
//   void initState() {
//     super.initState();
//     generateThumbnail();
//   }
//
//   void generateThumbnail() async {
//     _thumbnailUrl = await VideoThumbnail.thumbnailFile(
//         video:
//             "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
//         thumbnailPath: (await getTemporaryDirectory()).path.toString(),
//         imageFormat: ImageFormat.WEBP);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("Video Thumbnail"),
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               if (_thumbnailUrl != null)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Thumbnail using Video url :"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Image.network(_thumbnailUrl!),
//                       ],
//                     )
//                   ],
//                 ),
//             ],
//           ),
//         ));
//   }
// }
