import 'package:the_third/bloc/signin/signin_event.dart';
import 'package:the_third/bloc/signin/signin_state.dart';
import 'package:the_third/index.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  @override
  // TODO: implement initialState
  SignInState get initialState => SignInInitial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    // TODO: implement mapEventToState
    if (event is UserSignInEvent) {
      yield SignInLoading();
      try {
        yield SignInSuccess();
      } catch (err) {
        yield SignInFailed(err: err);
      }
    }
  }
}
