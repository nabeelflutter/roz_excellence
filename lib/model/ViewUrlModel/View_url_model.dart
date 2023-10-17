class ViewUrlModel{
  String url;
  String title;

  ViewUrlModel({required this.title,required this.url});
  String gettitle(){
    return title;
  }
  String getUrl(){
    return url;
  }
}