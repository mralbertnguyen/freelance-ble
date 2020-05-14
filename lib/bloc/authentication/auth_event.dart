import 'package:the_third/index.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserSignInSuccess extends AuthEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "AuthEvent => UserSignInSuccess";
}
class UserSignOut extends AuthEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "AuthEvent => UserSignOut";
}

class LoginWithPhoneEvent extends AuthEvent {
  final String phoneNumber;

  const LoginWithPhoneEvent({@required this.phoneNumber})
      : assert(phoneNumber != null);

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() =>
      "AuthEvent => LoginWithPhoneEvent => phone: $phoneNumber";
}
