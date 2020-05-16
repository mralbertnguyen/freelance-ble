import 'package:the_third/index.dart';

class RegisterScreen extends StatefulWidget {

  final String title;
  RegisterScreen({@required this.title}) : assert(title != null);


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneNumberController = new TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBack(widget.title),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        /// Logo
                        Logo(300),

                        /// Login form
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Text("Vui lòng nhập số điện thoại của bạn "),
                                /// Input Phone number
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.amber,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.amber, width: 3)),
                                      disabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.amber, width: 2),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                      ),
                                      focusColor: Colors.black,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          (value.length < 9 &&
                                              value.length > 12)) {
                                        return 'Vui lòng kiểm tra số điện thoại';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                /// Button submit
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(top: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.amber.withOpacity(0.7),
                                            border: Border.all(
                                                color:  Colors.amber,
                                                width: 1
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
//                                            _login(context);
                                            // Push phone number to verify screen
                                            if (_formKey.currentState
                                                .validate()) {
                                              String _phoneNo =
                                                  "+84${_phoneNumberController.value.text.substring(1)}";
                                              pushWithWidget(
                                                  context,
                                                  VerifyScreen(
                                                      phoneNumber: _phoneNo));
                                            }
                                          },
                                          child: Text(
                                            "Nhận mã xác thực",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void showShortToast(String msg) {
  Fluttertoast.showToast(
      msg: msg, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
}

void showLongToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
  );
}
