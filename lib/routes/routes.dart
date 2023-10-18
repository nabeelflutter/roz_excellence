import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/edit_course_screen/edit_course_screen.dart';
import 'package:rose_excellence_admin_panel_web1/view/screens/home_screen/home_screen.dart';
import '../view/screens/Conversation_screen/Conversation_screen.dart';
import '../view/screens/View_url_screen/View_url_screen.dart';
import '../view/screens/View_url_screen/View_url_screen1.dart';
import '../view/screens/add_course_information_screen/add_course_information_screen.dart';
import '../view/screens/add_course_screen/add_course_screen.dart';
import '../view/screens/add_lesson_screen/add_lesson_screen.dart';
import '../view/screens/add_new_admin_screen/add_new_admin_screen.dart';
import '../view/screens/admin_and_editors_screen/admin_and_editor_screen.dart';
import '../view/screens/all_students_screen/all_students_screen.dart';
import '../view/screens/all_students_view/all_students_view.dart';
import '../view/screens/assignments_screen/assignments_screen.dart';
import '../view/screens/enrolled_student_screen/enrolled_student_screen.dart';
import '../view/screens/enrolled_student_view_screen/enrolled_student_view_screen.dart';
import '../view/screens/fill_lesson_screen/fill_lesson_screen.dart';
import '../view/screens/home_screen/home_screen_behaviour.dart';
import '../view/screens/meaasge_user_list/message_user_list.dart';
import '../view/screens/play_video_screen/play_video_screen.dart';
import '../view/screens/view_assignments_screen/view_assignments_screen.dart';
import '../view/screens/view_editor_screen/view_editor_screen.dart';
import '../view/screens/view_lesson_screen/view_lesson_screen.dart';

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageName.homeScreenBehaviour:
        return MaterialPageRoute(
          builder: (context) =>  HomeScreenBehaviour(),
            settings: routeSettings
        );
      case PageName.addCourseScreen:
        return MaterialPageRoute(
          builder: (context) => const AddCoursesScreen(),
          settings: routeSettings
        );
      case PageName.addCourseInformationScreen:
        return MaterialPageRoute(
          builder: (context) => const AddCourseInformationScreen(),
            settings: routeSettings
        );
      case HomeScreen.pageName:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
            settings: routeSettings
        );
      case PageName.fillLessonScreen:
        return MaterialPageRoute(
          builder: (context) => const FillLessonScreen(),
            settings: routeSettings
        );
      case PageName.editCourseScreen:
        return MaterialPageRoute(
          builder: (context) =>  EditCourseScreen(),
          settings: routeSettings
        );
      case PageName.addLessonScreen:
        return MaterialPageRoute(
            builder: (context) =>  AddLessonScreen(),
            settings: routeSettings
        );
      case PageName.viewLessonScreen:
        return MaterialPageRoute(
            builder: (context) =>  ViewLessonScreen(),
            settings: routeSettings
        );
      case PageName.playVideoScreen:
        return MaterialPageRoute(
            builder: (context) =>  PlayVideoScreen(),
            settings: routeSettings
        );
      case PageName.enrolledStudentsScreen:
        return MaterialPageRoute(
            builder: (context) =>  EnrolledStudentsScreen(),
            settings: routeSettings
        );
      case PageName.enrolledStudentViewScreen:
        return MaterialPageRoute(
            builder: (context) =>  EnrolledStudentViewScreen(),
            settings: routeSettings
        );
      case PageName.allStudentsScreen:
        return MaterialPageRoute(
            builder: (context) =>  AllStudentsScreen(),
            settings: routeSettings
        );
      case PageName.allStudentsViewScreen:
        return MaterialPageRoute(
            builder: (context) =>  AllStudentsViewScreen(),
            settings: routeSettings
        );
      case PageName.viewUrlScreen:
        return MaterialPageRoute(
            builder: (context) =>  ViewUrlScreen(),
            settings: routeSettings
        );
      case PageName.viewUrlScreen1:
        return MaterialPageRoute(
            builder: (context) =>  ViewUrlScreen1(),
            settings: routeSettings
        );
      case PageName.messageUserLists:
        return MaterialPageRoute(
            builder: (context) =>  MessageUserLists(),
            settings: routeSettings
        );
      case PageName.conversationScreen:
        return MaterialPageRoute(
            builder: (context) =>  ConversationScreen(),
            settings: routeSettings
        );
      case PageName.assignmentsScreen:
        return MaterialPageRoute(
            builder: (context) =>  AssignmentsScreen(),
            settings: routeSettings
        );
      case PageName.viewAssignmentsScreen:
        return MaterialPageRoute(
            builder: (context) =>  ViewAssignmentsScreen(),
            settings: routeSettings
        );
      case PageName.adminAndEdotorScreen:
        return MaterialPageRoute(
            builder: (context) =>  AdminAndEdotorScreen(),
            settings: routeSettings
        );
      case PageName.addNewAdminScreen:
        return MaterialPageRoute(
            builder: (context) =>  AddNewAdminScreen(),
            settings: routeSettings
        );
      case PageName.viewEditorScreen:
        return MaterialPageRoute(
            builder: (context) =>  ViewEditorScreen(),
            settings: routeSettings
        );
      default:
        return MaterialPageRoute(
      settings: routeSettings,
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route define'),
            ),
          ),
        );
    }
  }
}