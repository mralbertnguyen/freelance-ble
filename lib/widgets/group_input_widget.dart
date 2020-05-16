import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:the_third/index.dart';

typedef ReturnCode(otp);
class GroupInputText extends StatefulWidget {

  final ReturnCode callBack;
  GroupInputText({@required this.callBack}) : assert(callBack != null);
  @override
  _GroupInputTextState createState() => _GroupInputTextState();
}

class _GroupInputTextState extends State<GroupInputText> {
  final _otpForm = GlobalKey<FormState>();

  // Custom
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 6;
  bool hasError = false;
  String errorMessage;

  submitVerifyCode(val){
    widget.callBack(val);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      child: Center(
        child: inputCode(controller, pinLength, hasError, (value) {
        }, (result) {
          submitVerifyCode(result);
        }),
      ),
    );
  }


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
          // TODO: call api to submit and verify OTP code
//        submitVerifyCode(context);
        widget.callBack(value);
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


}


Widget inputCode(TextEditingController controller, int pinLength, bool hasError,
    dynamic Function(String) onTextChanged, void Function(String) onDone) {
  return PinCodeTextField(
    autofocus: true,
    controller: controller,
    pinBoxHeight: 70.0,
    pinBoxWidth: 50.0,
    hideCharacter: false,
    highlight: true,
    highlightColor: mainColor,
    defaultBorderColor: Colors.grey[100],
    hasTextBorderColor: Colors.amber,
    maxLength: pinLength,
    hasError: hasError,
    maskCharacter: "😎",
    onTextChanged: onTextChanged,
    onDone: onDone,
    wrapAlignment: WrapAlignment.center,
    pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
    pinTextStyle: TextStyle(
      color:Colors.black,
      fontSize: 24,
    ),
    pinTextAnimatedSwitcherTransition:
    ProvidedPinBoxTextAnimation.scalingTransition,
                    pinBoxColor: Colors.white,
    pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
    highlightAnimationBeginColor: Colors.black,
    highlightAnimationEndColor: Colors.white12,
    keyboardType: TextInputType.number,
  );
}
