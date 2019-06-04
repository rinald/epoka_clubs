import '../utils/utils.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Epoka Clubs'),
      // ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
