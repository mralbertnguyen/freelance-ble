import 'package:the_third/index.dart';
import 'package:the_third/widgets/cus_input_with_label.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  /// Logo
                  Container(
                      margin: EdgeInsets.only(top: 100, bottom: 30),
                      child: Logo(300)),

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
                            label: "Số điện thoại",
                            textEditingController: _phoneNumberController,
                            onValidator: (value) {
                              if (value.isEmpty ||
                                  (value.length < 9 &&
                                      value.length > 12)) {
                                return 'Vui lòng kiểm tra số điện thoại';
                              }
                              return null;
                            },
                          ),

                          /// Input password
                          CusInputWithLabel(
                            label: "Mật khẩu",
                            textEditingController: _passwordController,
                            onValidator: (value) {
                              if (value.isEmpty ||
                                  (value.length < 9 &&
                                      value.length > 12)) {
                                return 'Vui lòng kiểm tra mật khẩu';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => RegisterScreen(title: "Đặt lại mật khẩu")));
                            },
                            child: Text("Quên mật khẩu?", style:
                            TextStyle(
                                decoration: TextDecoration.underline
                            ),),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => RegisterScreen(title: "Đăng ký tài khoản",)));
                            },
                            child: Text("Đăng ký"),
                          ),
                        )
                      ],
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
                                border: Border.all(
                                    color: Colors.amber, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                // Push phone number to verify screen
                                if (_formKey.currentState.validate()) {
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
