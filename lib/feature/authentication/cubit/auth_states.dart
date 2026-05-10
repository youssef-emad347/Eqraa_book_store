abstract class AuthStates {}

class AuthInatialState extends AuthStates {}

// Login
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String message;
  LoginSuccessState({required this.message});
}

class LoginErrorState extends AuthStates {
  final String message;
  LoginErrorState({required this.message});
}

// sing up
class SignUpLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {
  final String message;
  SignUpSuccessState({required this.message});
}

class SignUpErrorState extends AuthStates {
  final String message;
  SignUpErrorState({required this.message});
}

// Reset Password
class ResetPasswordLoadingState extends AuthStates {}

class ResetPasswordSuccessState extends AuthStates {
  final String message;
  ResetPasswordSuccessState({required this.message});
}

class ResetPasswordErrorState extends AuthStates {
  final String message;
  ResetPasswordErrorState({required this.message});
}
