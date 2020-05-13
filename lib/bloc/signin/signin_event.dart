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
