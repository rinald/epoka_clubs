import 'package:flutter/material.dart';

import '../models/event.dart';

final _events = <Event>[
  Event('Flutter Workshop', 'Programming Club', 'Kristjan'),
  Event('Next step for an engineer', 'Robotics Club', 'Not Kristjan'),
  Event('Games Day 2019', 'Sports Club', 'Not Kristjan'),
];

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${_events[index].title}'),
            subtitle: Text('${_events[index].club}'),
          );
        },
      ),
    );
  }
}
