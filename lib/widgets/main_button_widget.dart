import 'package:the_third/index.dart';

typedef OnPressedMainButton();

class MainButton extends StatefulWidget {
  final String title;
  final OnPressedMainButton onPressed;

  MainButton({@required this.title,@required this.onPressed});
  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.7),
            border:
            Border.all(color: Colors.amber, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          Text(
              "${widget.title}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
        ],),
      ),
    );
  }
}
