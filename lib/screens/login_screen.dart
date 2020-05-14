import 'package:the_third/index.dart';
import 'package:the_third/screens/verify_screen.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      appBar: null,
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
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 100, bottom: 30),
                          child: Image.asset(logoAsset, fit: BoxFit.fitWidth),
                        ),

                        /// Login form
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
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
                                      labelText: "Số điện thoại",
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
                                            color: Colors.amber,
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
                                            "ĐĂNG NHẬP",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
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
