import '../utils/utils.dart';
import '../widgets/club_card.dart';

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubs'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(clubNames.length, (index) {
          final _name = clubNames[index];

          return ClubCard(
            name: _name,
            icon: clubIcons[_name],
          );
        }),
      ),
      // body: Center(
      //   child: Container(
      //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Icon(
      //           Icons.error,
      //           size: 100,
      //           color: Colors.grey,
      //         ),
      //         Text('Nothing to see'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
