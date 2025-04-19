part of 'authentication_switch_cubit.dart';

@immutable
sealed class AuthenticationSwitchState  {
  final AuthenticationStateEntity authenticationState;
  final bool isSignInState;
  const AuthenticationSwitchState(
      {required this.isSignInState, required this.authenticationState});
}

final class AuthenticationSwitchInitial extends AuthenticationSwitchState {
  const AuthenticationSwitchInitial({required super.authenticationState})
      : super(
          isSignInState: true,
        );
}

final class SignInAuthenticationState extends AuthenticationSwitchState {
  const SignInAuthenticationState(
      {required super.authenticationState, required super.isSignInState});
}

final class SignUpAuthenticationState extends AuthenticationSwitchState {
  const SignUpAuthenticationState(
      {required super.authenticationState, required super.isSignInState});
}
