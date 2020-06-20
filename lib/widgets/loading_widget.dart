import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_third/index.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: SpinKitCircle(
        color: mainColor,
        size: 50.0,
      ),
    );
  }
}