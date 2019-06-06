import '../../data/clubs.dart';
import '../../utils/utils.dart';
import '../../widgets/club_card.dart';

class ClubsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubs.length + 1,
      itemBuilder: (_, index) {
        if (index != clubs.length) {
          return ClubCard(clubs[index]);
        } else {
          return SizedBox(height: 5.0);
        }
      },
    );
  }
}
