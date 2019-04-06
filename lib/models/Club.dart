

class Club {
  final String id;
  final String admin;
  final String name;

  const Club({
    this.id,
    this.name,
    this.admin
  });


  Club.fromMap(Map<String, dynamic> data, String id)
      : this(
    id: id,
    name: data['name'],
    admin: data['admin'],
  );
}
