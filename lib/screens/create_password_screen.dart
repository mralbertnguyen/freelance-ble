import 'package:the_third/index.dart';
import 'package:the_third/widgets/cus_input_with_label.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _reEnterPWController = new TextEditingController();

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
                    child: Text("Tạo mật khẩu mới cho tài khoản của bạn", style: TextStyle(
                      color: Colors.grey,
                    ),),
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
                            label: "Nhập lại mật khẩu",
                            textEditingController: _reEnterPWController,
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
//                                  String _phoneNo =
//                                      "${_.value.text.substring(1)}";
//                                  pushWithWidget(
//                                      context,
//                                      VerifyScreen(
//                                          phoneNumber: _phoneNo));
                                }
                              },
                              child: Text(
                                "Hoàn thành",
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
