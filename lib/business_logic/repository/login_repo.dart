


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/otp_response.dart';

import '../../constants/end_points.dart';
import '../../data/network/faliure.dart';
import '../../data/network/requests/login_request.dart';
import '../../data/network/requests/otp_request.dart';
import '../../data/network/responses/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(LoginRequest loginRequest);
  Future<Either<Failure, AccountModel>> verifyOtp(OtpRequest otpRequest);
}

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl();

  @override
  Future<Either<Failure, String>> login(LoginRequest loginRequest) async {
    try {

      FormData formData = FormData.fromMap(loginRequest.toJson());
      var responseData = await DioHelper.postData(
        body: formData,
          url: verifyPhoneBP);
      print(responseData.data);

      LoginResponse loginResponse=LoginResponse.fromJson(responseData.data);
      print(loginResponse.toJson());
      if(loginResponse.status==200)
        {
          return right(loginResponse.message??"");
        }
      else {
        return left(Failure("error", 400));
      }
    } catch (e) {
      print(e.toString());
      return left(Failure(e.toString(), 400));
    }
  }

  @override
  Future<Either<Failure, AccountModel>> verifyOtp(OtpRequest otpRequest)async {

    try {
      FormData formData = FormData.fromMap(otpRequest.toJson());
      var responseData = await DioHelper.postData(
          body: formData,
          url: otpBP);
      print(responseData.data);

      OtpResponse otpResponse=OtpResponse.fromJson(responseData.data);
      print(otpResponse.toJson());
      if(otpResponse.status==200)
      {
        CacheHelper.saveDataSharedPreference(key: "isLogin", value: true);
        return right(AccountModel.fromJson(otpResponse.account!.toJson()));
      }
      else {
        return left(Failure("error code ${otpResponse.status}", otpResponse.status??0));
      }
    } catch (e) {
      print(e.toString());
      return left(Failure(e.toString(), 0));
    }




  }
}
