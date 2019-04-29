class Club {
  Club({this.name, this.admin, this.description});
  String admin;
  final String name;
  String description = '';


  void setDesc(String desc){
    this.description = desc;
  }

  void setAdmin(String admin){
    this.admin = admin;
  }



  Club.fromMap(Map<String, dynamic> data, String id)
      : this(
    name: data['name'],
    admin: data['admin'],
  );
}
