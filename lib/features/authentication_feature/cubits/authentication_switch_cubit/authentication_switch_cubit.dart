import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/authentication_feature/models/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_switch_state.dart';

class AuthenticationSwitchCubit extends Cubit<AuthenticationSwitchState> {
  AuthenticationSwitchCubit()
      : super(AuthenticationSwitchInitial(
            authenticationState: SignInSwitchAuthenticationState()));
  static AuthenticationSwitchCubit get(context) => BlocProvider.of(context);

  changeAuthenticationState(
      {required AuthenticationState authenticationState}) {
    switch (authenticationState) {
      case SignInSwitchAuthenticationState():
        emit(SignInAuthenticationState(isSignInState: true,
            authenticationState: authenticationState));
        break;
      case SignUpSwitchAuthenticationState():
        emit(SignInAuthenticationState(
          isSignInState: false,
            authenticationState: authenticationState));
        break;
    }
  }
}
