import 'package:the_third/index.dart';

Widget customAppBarHome(String _title) {
  return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        _title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
//        IconButton(
//          icon: svgNotify,
//          tooltip: 'Next p                                                          age',
//          onPressed: () {
//            print("Press icon notify");
//          },
//        )
      ]);
}