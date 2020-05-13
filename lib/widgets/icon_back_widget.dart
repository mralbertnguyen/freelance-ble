import 'package:the_third/index.dart';

Widget customIconBackHasBr(BuildContext context) {
  return FlatButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: SvgPicture.asset(
      icBack,
      height: 20,
      width: 20,
    ),
  );
}
