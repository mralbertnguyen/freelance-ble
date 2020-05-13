import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future userSignInRepo(String phoneNo) async {
//    firebaseAuth.verifyPhoneNumber(
//        phoneNumber: phoneNo,
//        timeout: Duration(seconds: 60),
//        verificationCompleted: verificationCompleted,
//        verificationFailed: verificationFailed,
//        codeSent: codeSent,
//        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }


}
