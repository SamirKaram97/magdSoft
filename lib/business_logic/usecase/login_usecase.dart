import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/login_repo.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../data/network/faliure.dart';

class LoginUseCase
{
  final AuthRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure,String>> call(LoginRequest loginRequest) async
  {
    return await loginRepository.login(loginRequest);
  }
}
