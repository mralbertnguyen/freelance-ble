import 'package:the_third/index.dart';
import 'package:the_third/main.dart';
import 'package:the_third/screens/create_password_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
const String KEY_INFO = "info";

class VerifyScreen extends StatefulWidget {
  final String phoneNumber;

  VerifyScreen({@required this.phoneNumber}) : assert(phoneNumber != null);
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String _message = '';
  String _verificationId;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Storage _storage = new Storage();

  SignInInfoType info;

  final _signInBloc = SignInBloc();

  bool isLoading = false;

  _getOTPWithPhoneNo() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      print('Received phone auth credential: $phoneAuthCredential');
      setState(() {
        _message = 'Vui lòng kiểm tra lại mã OTP';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      setState(() {
        _message = 'Vui lòng kiểm tra lại mã OTP';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print("verificationId $verificationId");
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber(_otp) async {
    final SharedPreferences prefs = await _prefs;
    final SignInInfoType _oldInfo = await _storage.getInfo();

    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _otp,
    );

    final FirebaseUser user = (await _auth
            .signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
      if (user != null) {
        info = SignInInfoType.fromJson({
          "phone_number": widget.phoneNumber,
          "last_otp": _otp,
          "verification_id": _verificationId,
          "uuid": user.uid
        });
        await _storage.saveInfo(info);

        _signInBloc.add(UserStorageInfoSignIn(info: info));
      } else {
        setState(() {
          _message = 'Vui lòng kiểm tra lại mã OTP';
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOTPWithPhoneNo();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: customAppBarBack("Xác thực mã OTP"),
      body: BlocProvider(
        create: (context) => SignInBloc(),
        child: BlocListener<SignInBloc, SignInState>(
          bloc: _signInBloc,
          listener: (context, state) {
            if (state is SignInLoading) {
              setState(() {
                isLoading = true;
              });
            }

            if (state is SignInSuccess) {
              setState(() {
                isLoading = false;
              });

              /// Push to home
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CreatePasswordScreen()));
            }

            if (state is SignInFailed) {
              setState(() {
                isLoading = false;
              });
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            codeSent(widget.phoneNumber),
                            titleInputOTP(),
                            GroupInputText(callBack: _signInWithPhoneNumber),

                            /// Message error
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    _message,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                )
                              ],
                            )
//                      CounterDownTimer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading) LoadingScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleInputOTP() {
    return Container(
      margin: new EdgeInsets.only(bottom: 30),
      child: Text(
        "Nhập mã OTP",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget codeSent(String phoneNumber) {
    return Container(
      margin: new EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Mã được gửi tới: ",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            phoneNumber,
            style: TextStyle(
                fontSize: 18, color: mainColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
