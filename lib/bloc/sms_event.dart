import 'package:the_third/index.dart';

abstract class SmsEvent extends Equatable {
  const SmsEvent();
}

class SendSmsSEvent extends SmsEvent {
  @override
  List<Object> get props => [];
}
