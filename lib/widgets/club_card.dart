import '../models/club.dart';
import '../utils/utils.dart';

class ClubCard extends StatelessWidget {
  const ClubCard(this.club);
  final Club club;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(
              club.icon,
              color: Theme.of(context).accentColor,
            ),
            title: Text(club.name),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 5.0,
            ),
            child: Text(
              club.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: FlatButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
