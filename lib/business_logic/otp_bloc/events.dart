import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../data/network/requests/otp_request.dart';

abstract class OtpEvent{}

class OtpExecuteEvent extends OtpEvent{
  final OtpRequest otpRequest;

  OtpExecuteEvent(this.otpRequest);
}