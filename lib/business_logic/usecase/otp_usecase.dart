import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/otp_request.dart';

import '../../data/network/faliure.dart';
import '../repository/login_services.dart';

class OtpUseCase
{
  final AuthServices authServices;

  OtpUseCase(this.authServices);

  Future<Either<Failure,AccountModel>> call(OtpRequest loginRequest) async
  {
    return await authServices.verifyOtp(loginRequest);
  }
}
