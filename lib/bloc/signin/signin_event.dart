import 'package:the_third/index.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class UserSignInEvent extends SignInEvent {
  const UserSignInEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return "SignInEvent => UserSignInEvent";
  }
}

class UserStorageInfoSignIn extends SignInEvent {
  UserStorageInfoSignIn({@required this.info}) : assert(info != null);
  final SignInInfoType info;

  @override
  List<Object> get props => [info];

  @override
  String toString() {
    // TODO: implement toString
    return "SignInEvent => UserStorageInfoSignIn";
  }
}
