import 'package:the_third/index.dart';

Widget titleInputOTP() {
  return Container(
    margin: new EdgeInsets.only(bottom: 30),
    child: Text(
      "Nhập mã OTP",
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    ),
  );
}

Widget codeSent(String phoneNumber) {
  return Container(
    margin: new EdgeInsets.only(top: 25, bottom: 52),
    child: Row(
      children: <Widget>[
        Text(
          "Mã được gửi tới: ",
          style: TextStyle(fontSize: 18, color: mainColor),
        ),
        Text(
          phoneNumber,
          style: TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}

class VerifyScreen extends StatefulWidget {
  final String phoneNumber;
  VerifyScreen({@required this.phoneNumber}) : assert(phoneNumber != null);
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: customAppBarBack("Verify OTP"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      codeSent(widget.phoneNumber),
                      titleInputOTP(),
                      GroupInputText(),
//                      CounterDownTimer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
