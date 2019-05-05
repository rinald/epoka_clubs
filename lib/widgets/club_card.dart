import '../utils/utils.dart';

class ClubCard extends StatelessWidget {
  const ClubCard({this.name, this.icon});
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 40.0,
            color: Colors.blue,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            name,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
