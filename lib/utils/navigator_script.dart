import 'package:the_third/index.dart';

pushWithWidget(BuildContext context, Widget _widget) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (BuildContext context) => _widget));
}
