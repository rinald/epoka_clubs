class Club {
  const Club({this.id, this.name, this.admin});
  final String id;
  final String admin;
  final String name;

  factory Club.fromMap(Map<String, dynamic> data, String id) {
    return Club(
      id: id,
      name: data['name'],
      admin: data['admin'],
    );
  }
}
