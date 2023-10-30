import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  String? videoPath, videoTitle, videoSubTitle;

  PlayVideoScreen({super.key, this.videoPath, this.videoSubTitle, this.videoTitle}) {}

  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath.toString())
      ..addListener(() => setState(() {
            videoPosition = _controller!.value.position;
          }))
      ..initialize().then((_) => setState(() {
            videoLength = _controller!.value.duration;
          }));
  }

  Duration? videoLength;
  Duration? videoPosition;
  double volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/m_logo.png'),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (_controller!.value.isInitialized) ...<Widget>[
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
                VideoProgressIndicator(
                  _controller!,
                  allowScrubbing: true,
                  padding: const EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(_controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          _controller!.value.isPlaying
                              ? _controller!.pause()
                              : _controller!.play();
                        });
                      },
                    ),
                    Text(
                        '${convertToMinutesSeconds(videoPosition!)} / ${convertToMinutesSeconds(videoLength!)}'),
                    const SizedBox(width: 10),
                    Icon(animatedVolumeIcon(volume)),
                    Slider(
                      value: volume,
                      min: 0,
                      max: 1,
                      onChanged: (_volume) => setState(() {
                        volume = _volume;
                        _controller!.setVolume(_volume);
                      }),
                    ),
                    const Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.loop,
                          color: _controller!.value.isLooping
                              ? Colors.green
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller!
                                .setLooping(!_controller!.value.isLooping);
                          });
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.videoTitle.toString(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold
                        ,fontSize:20 ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.videoTitle.toString(),
                        style: const TextStyle(color: Colors.grey),
                      )),
                ),
                const SizedBox(height: 20,)
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
      seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}
// class PlayVideoScreen extends StatefulWidget {
//   const PlayVideoScreen({super.key});
//
//   @override
//   State<PlayVideoScreen> createState() => _PlayVideoScreenState();
// }
//
// class _PlayVideoScreenState extends State<PlayVideoScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = VideoPlayerController.network(
//       Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ).toString(),
//     );
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
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
//             color: Colors.white,
//           ),
//         ),
//         title: const CircleAvatar(
//           backgroundImage: AssetImage('assets/images/m_logo.png'),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.pink,
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               children: [
//                 // 80% of the screen for video player
//                 Expanded(
//                   flex: 8, // 80% of the available space
//                   child: Center(
//                     child: AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     ),
//                   ),
//                 ),
//                 // 20% of the screen for text
//                 const Expanded(
//                   flex: 2, // 20% of the available space
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 20,),
//                       Text('Nice',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//                       Text('video',style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
