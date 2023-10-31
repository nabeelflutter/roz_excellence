class AddCourseInformationModel {
  String courseName;
  String courseId;
  String courseTitle;
  String coursePrice;
  String courseDescription;
  String videoUrl;
  String courseDuration;

  AddCourseInformationModel({
    required this.courseId,
    required this.courseName,
    required this.courseTitle,
    required this.coursePrice,
    required this.courseDescription,
    required this.videoUrl,
    required this.courseDuration,
  });

  Map<String, dynamic> toMap() {
    return {
      'courseName': courseName,
      'courseTitle': courseTitle,
      'coursePrice': coursePrice,
      'courseDescription': courseDescription,
      'videoUrl': videoUrl,
      'courseDuration': courseDuration,
      'courseId':courseId
    };
  }

  factory AddCourseInformationModel.fromMap(Map<String, dynamic> map) {
    return AddCourseInformationModel(
      courseId:map['courseId'] ??'',
      courseName: map['courseName']??'',
      courseTitle: map['courseTitle']??'',
      coursePrice: map['coursePrice']??'',
      courseDescription: map['courseDescription']??'',
      videoUrl: map['videoUrl']??'',
      courseDuration: map['courseDuration']??'',
    );
  }
}
