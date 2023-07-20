abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginSuccessState extends LoginState{
  final String message;

  LoginSuccessState(this.message);
}
class LoginLoadingState extends LoginState{}

class LoginErrorState extends LoginState{
  final String message;

  LoginErrorState(this.message);
}