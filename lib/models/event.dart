class Event {
  const Event(this.title, this.club, this.admin);
  final String title;
  final String club;
  final String admin;
}
class Info{
  Info(this.descr,this.title,this.participants,this.id,this.img);
  String  img , title;
  List<String> descr;
  int participants,id;
}