import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/login_services.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../data/network/faliure.dart';

class LoginUseCase
{
  final AuthServices authServices;

  LoginUseCase(this.authServices);

  Future<Either<Failure,String>> call(LoginRequest loginRequest) async
  {
    return await authServices.login(loginRequest);
  }
}
