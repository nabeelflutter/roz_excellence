import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rose_excellence_admin_panel_web1/routes/routes.dart';
import 'package:rose_excellence_admin_panel_web1/test.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/home_screen/home_screen.dart';
import 'package:rose_excellence_admin_panel_web1/view_model/login_bloc/login_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyASljnvY9UBQEDOEfPlHnWG2wXM4PD6u3c",
      appId: "1:15144932025:web:21035d0d5114e17eb5c168",
      projectId: "roseexcellence-d5e87", messagingSenderId: '15144932025',
      storageBucket: "roseexcellence-d5e87.appspot.com",
      authDomain: "roseexcellence-d5e87.firebaseapp.com",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LoginBloc(),)
    ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoutes,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:   HomeScreen()
      //initialRoute: HomeScreen.pageName,
    ));
  }
}


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VideoPicker(),
//     );
//   }
// }
//
// class VideoPicker extends StatefulWidget {
//   @override
//   _VideoPickerState createState() => _VideoPickerState();
// }
//
// class _VideoPickerState extends State<VideoPicker> {
//   VideoPlayerController? _controller;
//
//   Future<void> _pickVideo() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       allowMultiple: false,
//     );
//
//     if (result != null) {
//       List<PlatformFile> files = result.files;
//       if (files.isNotEmpty) {
//         // On web, access the 'bytes' property instead of 'path'
//         final uint8List = files[0].bytes;
//         _controller = VideoPlayerController.file(File(uint8List.toString()));
//         await _controller!.initialize();
//         setState(() {});
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Picker and Player'),
//       ),
//       body: Center(
//         child: _controller != null
//             ? AspectRatio(
//           aspectRatio: _controller!.value.aspectRatio,
//           child: VideoPlayer(_controller!),
//         )
//             : Text('Pick a video to display'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickVideo,
//         child: Icon(Icons.file_upload),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
