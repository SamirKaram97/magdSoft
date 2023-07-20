import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

abstract class OtpState{}

class OtpInitialState extends OtpState{}

class OtpSuccessState extends OtpState{
  final AccountModel accountModel;

  OtpSuccessState(this.accountModel);
}
class OtpLoadingState extends OtpState{}

class OtpErrorState extends OtpState{
  final String message;

  OtpErrorState(this.message);
}