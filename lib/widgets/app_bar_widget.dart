import 'package:the_third/index.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

Widget customAppBarBack(String title) {
  return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return customIconBackHasBr(context);
        },
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      actions: null);
}


Widget customAppBarHome(String _title) {
  return AppBar(
      backgroundColor: Colors.black,
      bottomOpacity: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        _title,
        style: TextStyle(
            color: Colors.white,
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