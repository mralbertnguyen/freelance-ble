import 'package:the_third/index.dart';

class SignInRepository {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//  String _message = '';
//  String _verificationId;
//
//  _getOTPWithPhoneNo() async {
//    final PhoneVerificationCompleted verificationCompleted =
//        (AuthCredential phoneAuthCredential) {
//      _auth.signInWithCredential(phoneAuthCredential);
//      setState(() {
//        _message = 'Received phone auth credential: $phoneAuthCredential';
//      });
//    };
//
//    final PhoneVerificationFailed verificationFailed =
//        (AuthException authException) {
//      setState(() {
//        _message =
//        'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
//      });
//    };
//
//    final PhoneCodeSent codeSent =
//        (String verificationId, [int forceResendingToken]) async {
//      showLongToast("'Please check your phone for the verification code.'");
//      print("verificationId $verificationId");
//      _verificationId = verificationId;
//    };
//
//    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//        (String verificationId) {
//      _verificationId = verificationId;
//    };
//
//    await _auth.verifyPhoneNumber(
//        phoneNumber: widget.phoneNumber,
//        timeout: const Duration(seconds: 5),
//        verificationCompleted: verificationCompleted,
//        verificationFailed: verificationFailed,
//        codeSent: codeSent,
//        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//  }
//
//  // Example code of how to sign in with phone.
//  void _signInWithPhoneNumber(_otp) async {
//    print("OTP CODE TYPED: $_otp");
//
//    final AuthCredential credential = PhoneAuthProvider.getCredential(
//      verificationId: _verificationId,
//      smsCode: _otp,
//    );
//    final FirebaseUser user =
//        (await _auth.signInWithCredential(credential)).user;
//    final FirebaseUser currentUser = await _auth.currentUser();
//    assert(user.uid == currentUser.uid);
//    setState(() {
//      if (user != null) {
//        _message = 'Successfully signed in, uid: ' + user.uid;
//      } else {
//        _message = 'Sign in failed';
//      }
//    });
//  }

}
