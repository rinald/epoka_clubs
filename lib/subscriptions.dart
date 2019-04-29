import 'util.dart';

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
    SubscriptionSample('Albert'),
    SubscriptionSample('Besjon'),
    SubscriptionSample('Rinald'),
    SubscriptionSample('Halit'),
    SubscriptionSample('Kristjan'),
  ];
  
  @override
  Widget build (BuildContext ctxt) {
    return ListView.builder(
      itemCount: _subs.length,
      itemBuilder:(context, index){
        return ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('${_subs[index].name}'),
          trailing: Icon(Icons.remove_circle),
        );
      },
    );
  }
}

