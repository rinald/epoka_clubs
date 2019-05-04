import 'util.dart';

class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscriptions'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        // Remove the DogCard Widget.
        // Instead, use your new DogList Class,
        // Pass in the mock data from the list above.
        child: Center( // Changed code
          child: ListDisplay(), // Changed code
        ),
      ),
    );
  }
}

class ListDisplay extends StatelessWidget {

  @override
  Widget build (BuildContext ctxt) {
    return makeBody;

  }

  final makeBody = Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _subs.length,
      itemBuilder: (BuildContext context, int index) {
        return makeCard;
      },
    ),
  );


  static final _subs = <SubscriptionSample>[
    SubscriptionSample('PC'),
    SubscriptionSample('BC'),
    SubscriptionSample('EC'),
    SubscriptionSample('AC'),
  ];

  static List<String> myList = ['one', 'two', 'three', 'four'];
  static List<Widget> widgets = myList.map((text) => new Text(text, style: TextStyle(color: Colors.blue),)).toList();

  static ListTile makeListTile() => ListTile(

    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

    leading: Container(

      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),


//    title: widgets,
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              // tag: 'hero',
              child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),

                  valueColor: AlwaysStoppedAnimation(Colors.green)),
            )),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('adsasdasdas',
                  style: TextStyle(color: Colors.white))),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),


  );


  static final makeCard = Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(),
    ),
  );




}

