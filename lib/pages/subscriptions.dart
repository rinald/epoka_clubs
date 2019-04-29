import '../util.dart';

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
  final _subs = <SubscriptionSample>[
    SubscriptionSample('Albert', 1),
    SubscriptionSample('Besjon', 2),
    SubscriptionSample('Rinald', 3),
    SubscriptionSample('Halit', 4),
    SubscriptionSample('Kristjan', 5),
  ];
  
  @override
  Widget build (BuildContext ctxt) {
    return ListView.builder(
      itemCount: _subs.length,
      itemBuilder:(context, index){
        return ListTile(
          leading: Text('${_subs[index].id}'),
          title: Text('${_subs[index].name}'),
          trailing: Icon(Icons.message),
        );
      },
    );
  }
}

