import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:the_third/index.dart';

Widget itemInputOTP(BuildContext context, TextEditingController txtController,
    FocusNode focusNode, FocusNode prevNode, FocusNode nextFocus) {
  return Container(
    height: 80,
    width: 65,
    margin: EdgeInsets.only(left: 12.5, right: 12.5),
    child: TextFormField(
      controller: txtController,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: mainColor,
          fontSize: 25,
          fontWeight: FontWeight.bold),
      enableInteractiveSelection: false,
      autofocus: prevNode == null ? true : false,
      onChanged: (String value) {
        print("Value input OTP + " + value.length.toString());
        if (value.length == 1) {
          FocusScope.of(context).requestFocus(nextFocus);
        }

        if (value.length < 1) {
          FocusScope.of(context).requestFocus(prevNode);
        }

        // TODO: call api sto submit and verify OTP code
        submitVerifyCode(context);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      decoration: InputDecoration(
          counterText: "",
          focusedBorder: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: new BorderSide(color: mainColor, width: 1),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      maxLength: 1,
      maxLines: 1,
      keyboardType: TextInputType.number,
    ),
  );
}

submitVerifyCode(BuildContext context) async {

  // TODO: Call api verify OTP
  // Verify to SERVER
  // NOTE: change to home
//  Future.delayed(Duration(milliseconds: 200),(){
//    changeWithRouteName(context, RouteName.mainRoute);
//  });

}

class GroupInputText extends StatefulWidget {
  @override
  _GroupInputTextState createState() => _GroupInputTextState();
}

class _GroupInputTextState extends State<GroupInputText> {
  final _otpForm = GlobalKey<FormState>();

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();

  FocusNode firstTextFN = new FocusNode();
  FocusNode secondTextFN = new FocusNode();
  FocusNode thirdTextFN = new FocusNode();
  FocusNode fourthTextFN = new FocusNode();

  // Custom
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: inputCode(controller, pinLength, hasError, (value) {
        print("value pin code $value}");
      }, (value) {
        submitVerifyCode(context);
      }),
    );
  }
}


Widget inputCode(TextEditingController controller, int pinLength, bool hasError,
    dynamic Function(String) onTextChanged, void Function(String) onDone) {
  return PinCodeTextField(
    autofocus: true,
    controller: controller,
    pinBoxHeight: 80.0,
    pinBoxWidth: 60.0,
    hideCharacter: false,
    highlight: true,
    highlightColor: mainColor,
    defaultBorderColor: Colors.black,
    hasTextBorderColor: Colors.black,
    maxLength: pinLength,
    hasError: hasError,
    maskCharacter: "😎",
    onTextChanged: onTextChanged,
    onDone: onDone,
    wrapAlignment: WrapAlignment.spaceAround,
    pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
    pinTextStyle: TextStyle(
      color:Colors.black,
      fontSize: 30,
    ),
    pinTextAnimatedSwitcherTransition:
    ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
    pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
    highlightAnimationBeginColor: Colors.black,
    highlightAnimationEndColor: Colors.white12,
    keyboardType: TextInputType.number,
  );
}
