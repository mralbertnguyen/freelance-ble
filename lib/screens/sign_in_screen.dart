import 'package:flutter/material.dart';
import 'package:the_third/index.dart';
import 'package:the_third/layouts/view_has_loading.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final Storage _storage = new Storage();
  final StringHandler _stringHandler = new StringHandler();

  bool _isLoginFailed = false;
  String _errorMsg = "";

  bool _isLoading = false;

  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  _submitFormLogin() async {
    // Push phone number to verify screen
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      var _phone = _phoneNumberController.value.text;
      var _pass = _passwordController.value.text;

      /// Get user from storage
      /// if has not => first time user install app on this device => required register new phone with OTP
      /// user info existed => compare user name and password to login
      Future.delayed(Duration(microseconds: 4000));

      SignInInfoType _storageInfo = await _storage.getInfo();

      print(_storageInfo);
      if (_storageInfo == null) {
        setState(() {
          _isLoginFailed = true;
          _errorMsg = "Chưa đăng ký tài khoản trên thiết bị này";
        });
      } else {
        String _finalPhoneNo = _stringHandler.handlePhoneNo(_phone);
        print("Phone: $_finalPhoneNo === Password: $_pass}");

        if (_storageInfo.phoneNumber != _finalPhoneNo ||
            _storageInfo.password != _pass) {
          setState(() {
            _isLoginFailed = true;
            _errorMsg = "Thông tin đăng nhập không chính xác";
          });
        }
        if (_storageInfo.phoneNumber == _finalPhoneNo &&
            _storageInfo.password == _pass) {
          setState(() {
            _isLoginFailed = false;
            _errorMsg = "";
          });
          pushWithWidget(context, HomeScreen());
        }
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// TODO: Test function
//_save() async{
//  SignInInfoType info = SignInInfoType.fromJson({
//    "phone_number": "+84869209655",
//    "last_otp": "123456",
//    "verification_id": "AM5PThDKMzwEmXhhJMrs3Lz9TL3ZJE7-lf_58HfRzW6Ixprkg-Cwu-gpOnbI80XdF0OvAFIwWkEFbId9LsaOvdbWyNb9J_yx0lP-KuM1Zl_7rv3ZvWrnwuCXLFB7ceJqQ1UYx_Xrk3PintykF4xcT0UQ_nK6E4iAfg",
//    "uuid": "user.uid",
//    "password" : "123456"
//  });
//  await _storage.saveInfo(info);
//}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _save();
  }

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
              color: Colors.red,
              child: ViewHasLoading(
                isLoading: _isLoading,
                loadingColor: mainColor,
                childrenWidget: Stack(
                  children: <Widget>[
                    /// logo and form login
                    Column(
                      children: <Widget>[
                        /// Logo
                        Container(
                            margin: EdgeInsets.only(top: 100, bottom: 30),
                            child: Logo(200)),

                        /// Login form
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                /// Input Phone number
                                CusInputWithLabel(
                                  label: "Số điện thoại",
                                  textEditingController: _phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  onValidator: (value) {
                                    if (value.isEmpty ||
                                        (value.length < 9 && value.length > 12)) {
                                      return 'Vui lòng kiểm tra số điện thoại';
                                    }
                                    return null;
                                  },
                                ),

                                /// Input password
                                CusInputWithLabel(
                                  label: "Mật khẩu",
                                  textEditingController: _passwordController,
                                  keyboardType: TextInputType.text,
                                  isSecure: true,
                                  onValidator: (value) {
                                    if (value.isEmpty ||
                                        (value.length < 9 && value.length > 12)) {
                                      return 'Vui lòng kiểm tra mật khẩu';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// Show error message
                        if (_isLoginFailed)
                          Container(
                            child: Center(
                              child: Text(
                                _errorMsg,
                                style: TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ),
                          ),


                        /// TODO: Remember password

                        /// Button submit
                        Container(
                          margin: EdgeInsets.only(top:20),
                            child: MainButton(title: "Đăng nhập",onPressed: _submitFormLogin,)),

                      ],
                    ),

                    /// View show button forgot password and register
                    Positioned(
                      bottom: 10,
                      right: 30,
                      left: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RegisterScreen(
                                                    title: "Đặt lại mật khẩu")));
                                  },
                                  child: Text(
                                    "Quên mật khẩu?",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),

                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RegisterScreen(
                                                  title: "Đăng ký tài khoản",
                                                )));
                                  },
                                  child: Text("Đăng ký"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Loading view
                    if(_isLoading) LoadingScreen()
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
