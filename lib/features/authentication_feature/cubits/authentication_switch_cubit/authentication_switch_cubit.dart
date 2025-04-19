import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/authentication_feature/entities/authentication_state_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_switch_state.dart';

class AuthenticationSwitchCubit extends Cubit<AuthenticationSwitchState> {
  AuthenticationSwitchCubit()
      : super(AuthenticationSwitchInitial(
            authenticationState: SignInSwitchAuthenticationStateEntity()));
  static AuthenticationSwitchCubit get(context) => BlocProvider.of(context);

  changeAuthenticationState(
      {required AuthenticationStateEntity authenticationState}) {
    switch (authenticationState) {
      case SignInSwitchAuthenticationStateEntity():
        emit(SignInAuthenticationState(isSignInState: true,
            authenticationState: authenticationState));
        break;
      case SignUpSwitchAuthenticationStateEntity():
        emit(SignInAuthenticationState(
          isSignInState: false,
            authenticationState: authenticationState));
        break;
    }
  }
}
