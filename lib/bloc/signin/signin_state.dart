import 'package:the_third/index.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailed extends SignInState {
  final String err;
  const SignInFailed({@required this.err}) : assert(err != null);

  @override
  List<Object> get props => [];
}
