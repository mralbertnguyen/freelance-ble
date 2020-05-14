import 'package:the_third/index.dart';
import 'package:the_third/bloc/authentication/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  // TODO: implement initialState
  get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(event) async* {
    // TODO: implement mapEventToState
    if (event is UserSignInSuccess) {
      yield AuthLoading();
      try {
        yield AuthAuthenticated();
      } catch (err) {
        yield AuthFailed(err: err.toString());
      }
    }

    if (event is UserSignOut) {
      yield AuthLoading();
      try {
        yield AuthUnAuthenticate();
      } catch (err) {
        yield AuthFailed(err: err.toString());
      }
    }
  }
}
