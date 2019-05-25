import 'package:epokaclubs/src/blocs/subscription/subscription_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../models/club.dart';
import '../utils/utils.dart';
import '../pages/club_info.dart';

class FollowButton extends StatefulWidget {
  FollowButton(this.club);
  final Club club;

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton>
    with AutomaticKeepAliveClientMixin<FollowButton> {
  Color _color;
  String _text = 'Subscribe';

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    _color = Theme.of(context).accentColor;
    super.didChangeDependencies();
  }

  void _toggleFollow() {
    final _bloc = BlocProvider.of<SubscriptionBloc>(context);

    setState(() {
      _color = (_color == Theme.of(context).accentColor)
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentColor;

      _text = (_text == 'Subscribe') ? 'Subscribed' : 'Subscribe';
    });

    if (_text == 'Subscribed') {
      _bloc.onSubscribe(widget.club);
    } else {
      _bloc.onUnsubscribe(widget.club);
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
    // final _bloc = BlocProvider.of<SubscriptionBloc>(context);

    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Card(
        child: InkWell(
          // highlightColor: Color(0x0F00AFF0),
          // splashColor: Color(0x0F0C5BA6),
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ClubInfoPage(club),
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
                child: Text(club.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0).copyWith(
                      right: 10.0,
                    ),
                    child: FollowButton(club),
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
