import '../models/club.dart';
import '../utils/utils.dart';

class FollowButton extends StatefulWidget {
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  Color _color;
  String _text = 'Follow';

  @override
  void didChangeDependencies() {
    _color = Theme.of(context).accentColor;
    super.didChangeDependencies();
  }

  void _toggleFollow() {
    setState(() {
      _color = (_color == Theme.of(context).accentColor)
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentColor;

      _text = (_text == 'Follow') ? 'Following' : 'Follow';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: _color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        _text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: _toggleFollow,
    );
  }
}

class ClubCard extends StatelessWidget {
  const ClubCard(this.club);
  final Club club;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(
                club.icon,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                club.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15.0,
              ),
              child: Text(
                club.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0).copyWith(
                    right: 10.0,
                  ),
                  child: FollowButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
