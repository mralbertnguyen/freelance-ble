import 'package:the_third/index.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoginFailed = false;
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  _login() {
    if (_formKey.currentState.validate()) {
      if (_phoneNumberController.value.text == "0909123321" &&
          _passController.value.text == "adminadmin") {
        setState(() {
          isLoginFailed = true;
        });
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        setState(() {
          isLoginFailed = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Center(
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
                                fontSize: 16, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: "Số điện thoại",
                              fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
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
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              focusColor: Colors.black,
                            ),
                            validator: (value) {
                              if (value.isEmpty &&
                                  (value.length < 9 && value.length > 12)) {
                                return 'Vui lòng kiểm tra số điện thoại';
                              }
                              return null;
                            },
                          ),
                        ),

                        /// Input password
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          child: TextFormField(
                            controller: _passController,
                            cursorColor: Colors.amber,
                            obscureText: true,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
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
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              focusColor: Colors.black,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Vui lòng kiểm tra mật khẩu ';
                              }
                              return null;
                            },
                          ),
                        ),

                        /// Text error
                        if (isLoginFailed)
                          Text("Thông tin đăng nhập không chính xác",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),

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
                                    borderRadius: BorderRadius.circular(5)),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed:_login,
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
      ),
    );
  }
}
