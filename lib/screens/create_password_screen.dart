import 'package:the_third/index.dart';
import 'package:the_third/widgets/cus_input_with_label.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SignInInfoType info;

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _reEnterPWController = new TextEditingController();

  _createNewPassword() async {
    /// Get shared preference
    final SharedPreferences prefs = await _prefs;
    SignInInfoType _info =
        SignInInfoType.fromJson(json.decode(prefs.getString(KEY_INFO)));

    if (_info != null) {
      setState(() {
        info = prefs.getString(KEY_INFO) as SignInInfoType;
      });
    } else {
      showShortToast("Can not get info data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _createNewPassword();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _reEnterPWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBack("Tạo mật khẩu"),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Tạo mật khẩu mới cho tài khoản của bạn",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
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
                          CusInputWithLabel(
                            label: "Mật khẩu mới",
                            textEditingController: _passwordController,
                            isSecure: true,
                            keyboardType: TextInputType.visiblePassword,
                            onValidator: (value) {
                              if ((value.length < 6)) {
                                return 'Vui lòng nhập mật khẩu dài hơn 6 ký tự';
                              }
                              return null;
                            },
                          ),

                          /// Input password
                          CusInputWithLabel(
                            label: "Nhập lại mật khẩu",
                            textEditingController: _reEnterPWController,
                            keyboardType: TextInputType.visiblePassword,
                            isSecure: true,
                            onValidator: (value) {
                              if ((value.length < 6)) {
                                return 'Vui lòng nhập mật khẩu dài hơn 6 ký tự';
                              }

                              if (_passwordController.value.text != value) {
                                return 'Mật khẩu không khớp, vui lòng kiểm tra lại';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Button submit
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.7),
                                border:
                                    Border.all(color: Colors.amber, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                // Push phone number to verify screen
                                if (_formKey.currentState.validate()) {
//                                  String _phoneNo =
//                                      "${_.value.text.substring(1)}";
//                                  pushWithWidget(
//                                      context,
//                                      VerifyScreen(
//                                          phoneNumber: _phoneNo));
                                }
                              },
                              child: Text(
                                "Tạo mật khẩu mới",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
