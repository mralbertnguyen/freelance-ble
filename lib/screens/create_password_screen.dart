import 'package:the_third/index.dart';
import 'package:the_third/widgets/cus_input_with_label.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Storage _storage = new Storage();

  SignInInfoType info;

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _reEnterPWController = new TextEditingController();

  _createNewPassword() async {
    // Push phone number to verify screen
    if (_formKey.currentState.validate()) {
      if (_passwordController.value.text == _reEnterPWController.value.text) {
        // Storage info
        setState(() {
          info.password = _passwordController.value.text;
        });

        await _storage.saveInfo(info);

        showLongToast("Tạo mật khẩu mới thành công.");

        /// TODO: back to login screen
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    }
  }

  _initValue() async {
    /// Get shared preference
    SignInInfoType _info = await _storage.getInfo();
    if (_info != null) {
      setState(() {
        info = _info;
      });
    } else {
      print("Can not get info data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initValue();
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

                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Số điện thoại đăng ký: ${info.phoneNumber ?? "+84xxxxxxxxxx"}",
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
                      margin: EdgeInsets.only(top:20),
                      child: MainButton(title: "Tạo mật khẩu mới",onPressed: _createNewPassword,)),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
