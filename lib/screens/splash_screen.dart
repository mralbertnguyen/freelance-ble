import 'package:the_third/index.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _moveToLogin() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:null
      ,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: 200,
            child: Image.asset(logoAsset, fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
