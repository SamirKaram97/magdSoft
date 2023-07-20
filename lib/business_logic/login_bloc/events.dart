import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

abstract class LoginEvent{}

class LoginExecuteEvent extends LoginEvent{
  final LoginRequest loginRequest;

  LoginExecuteEvent(this.loginRequest);
}