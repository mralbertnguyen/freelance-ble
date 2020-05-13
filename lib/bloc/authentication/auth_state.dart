import 'package:the_third/index.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUnAuthenticate extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthFailed extends AuthState {
  final String err;
  AuthFailed({@required this.err});
  @override
  List<Object> get props => [err];
}
