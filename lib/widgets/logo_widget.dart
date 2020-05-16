import 'package:the_third/index.dart';
Widget Logo(double size){
  return  /// Logo
    Container(
      width: size,
      child: Image.asset(logoAsset, fit: BoxFit.fitWidth),
    );
}