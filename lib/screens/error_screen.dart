import 'package:the_third/index.dart';

class ErrorScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(child: Container(
          color: Colors.white,
          child: Text('Thông tin bị lỗi, vui lòng thử lại sau!'),
        )),
      ),
    );
  }
}