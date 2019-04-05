import 'util.dart';
import 'package:epokaclubs/subscriptionSample.dart';

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
  final subs = <SubscriptionSample>[
    SubscriptionSample('Albert', 1),
    SubscriptionSample('Besjon', 1),
    SubscriptionSample('Rinald', 1),
  ];
  
  @override
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

