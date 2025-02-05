import 'package:flutter/cupertino.dart';

import '../blocs/subscription/subscription_bloc.dart';
import '../models/club.dart';
import '../screens/club_info_screen.dart';
import '../utils/utils.dart';

class FollowButton extends StatefulWidget {
  FollowButton(this.clubName);
  final String clubName;

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  Color _color;
  String _text = 'Subscribe';
  SubscriptionBloc _subsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subsBloc = BlocProvider.of<SubscriptionBloc>(context);
    final _subs = _subsBloc.currentState.subscriptions;

    if (_subs.contains(widget.clubName)) {
      _color = Theme.of(context).primaryColor;
      _text = 'Subscribed';
    } else {
      _color = Theme.of(context).accentColor;
      _text = 'Subscribe';
    }
  }

  void _toggleFollow() {
    setState(() {
      _color = (_color == Theme.of(context).accentColor)
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentColor;

      _text = (_text == 'Subscribe') ? 'Subscribed' : 'Subscribe';
    });

    if (_text == 'Subscribed') {
      _subsBloc.onSubscribe(widget.clubName);
    } else {
      _subsBloc.onUnsubscribe(widget.clubName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: _color,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: Text(_text),
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
        child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ClubInfoScreen(club),
              ),
            );
          },
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5.0,
                ),
                child: Text(
                  'Club description...',
                  style: TextStyle(
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
                    child: FollowButton(club.name),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
