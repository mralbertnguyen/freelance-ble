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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      /// Logo
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 30),
                          child: Logo(200)),

                      /// Register form
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
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


                            ],
                          ),
                        ),

                      ),
                      /// Button submit
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: MainButton(
                            title: "Nhận mã xác thực",
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
                          )),
                    ],
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
