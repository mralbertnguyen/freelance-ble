import 'package:the_third/index.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            /// Logo
            Container(
              width: 200,
              child: Image.asset(logoAsset, fit: BoxFit.fitWidth),
            )
          ],),
        ),
      ),
    );
  }
}
