import 'dart:typed_data';

import '../utils/utils.dart';

class GoogleAvatar extends StatelessWidget {
  GoogleAvatar({this.url, this.radius});
  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (radius * 2),
      height: (radius * 2),
      child: ClipOval(
        child: FadeInImage.memoryNetwork(
          fadeInDuration: const Duration(milliseconds: 50),
          fadeOutDuration: const Duration(milliseconds: 50),
          placeholder: Uint8List(((radius * 2).round() * (radius * 2).round())),
          image: url,
        ),
      ),
    );
  }
}
