import '../../data/clubs.dart';
import '../../utils/utils.dart';
import '../../widgets/club_card.dart';

class ClubsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (_, index) => ClubCard(clubs[index]),
    );
  }
}
