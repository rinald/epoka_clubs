import 'package:epokaclubs/subscriptionSample.dart';
import 'package:flutter/material.dart';


class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatelessWidget {
  @override

  static subscriptionSample item1 = new subscriptionSample("Albert",1);
  static subscriptionSample item2 = new subscriptionSample("Besjon", 2);
  static subscriptionSample item3 = new subscriptionSample("Rinald", 3);
  static subscriptionSample item4 = new subscriptionSample("Halit",4);
  static subscriptionSample item5 = new subscriptionSample("Kristijan",5);

  List<subscriptionSample>  subs  = [item1, item2,item3,item4,item5];

  Widget build (BuildContext ctxt) {

    return new Scaffold(

        appBar: new AppBar(title: new Text("Subsribers"),),
        body: ListView.builder(
          itemCount: subs.length,
          itemBuilder:(context, index){
            return ListTile(
              leading: Text('${subs[index].id}'),
              title: Text('${subs[index].name}'),
              trailing: Icon(Icons.message),
            );
          },

    )
    );
  }
}

