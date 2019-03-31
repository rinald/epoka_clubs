import 'package:epokaclubs/subscriptionSample.dart';
import 'package:flutter/material.dart';


class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscriptions'),
      ),
      body: ListDisplay(),
    );
  }
}

class ListDisplay extends StatelessWidget {
  @override

  static SubscriptionSample item1 = SubscriptionSample("Albert",1);
  static SubscriptionSample item2 = SubscriptionSample("Besjon", 2);
  static SubscriptionSample item3 = SubscriptionSample("Rinald", 3);

  List<SubscriptionSample> subs = [item1, item2,item3];

  Widget build (BuildContext ctxt) {

    return ListView.builder(
      itemCount: subs.length,
      itemBuilder:(context, index){
        return ListTile(
          leading: Text('${subs[index].id}'),
          title: Text('${subs[index].name}'),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
    );
  }
}

