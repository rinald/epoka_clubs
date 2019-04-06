class Club {
  const Club({this.id, this.name, this.admin});
  final String id;
  final String admin;
  final String name;

  Club.fromMap(Map<String, dynamic> data, String id)
      : this(
    id: id,
    name: data['name'],
    admin: data['admin'],
  );
}
