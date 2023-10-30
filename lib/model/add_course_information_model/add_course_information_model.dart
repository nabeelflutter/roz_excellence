class AddCourseInformationModel {
  String courseName;
  String id;
  String courseTitle;
  String coursePrice;
  String courseDescription;
  String videoUrl;
  String courseDuration;

  AddCourseInformationModel({
    required this.id,
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
      'id':id
    };
  }

  factory AddCourseInformationModel.fromMap(Map<String, dynamic> map) {
    return AddCourseInformationModel(
      id:map['id'],
      courseName: map['courseName'],
      courseTitle: map['courseTitle'],
      coursePrice: map['coursePrice'],
      courseDescription: map['courseDescription'],
      videoUrl: map['videoUrl'],
      courseDuration: map['courseDuration'],
    );
  }
}
