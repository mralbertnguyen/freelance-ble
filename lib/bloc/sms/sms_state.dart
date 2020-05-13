import 'package:the_third/index.dart';

abstract class SmsState extends Equatable {
  const SmsState();

  @override
  List<Object> get props => [];
}

class SmsEmpty extends SmsState {}

class SmsLoading extends SmsState {}

class SmsLoaded extends SmsState {}

class SmsError extends SmsState {
  final String err;

  SmsError({@required this.err}) : assert(err != null);

  @override
  List<Object> get props => [err];

  @override
  String toString() {
    // TODO: implement toString
    return "SmsState => SmsError => $err";
  }
}
