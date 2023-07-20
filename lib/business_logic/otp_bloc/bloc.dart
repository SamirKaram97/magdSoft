import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/login_usecase.dart';

import '../usecase/otp_usecase.dart';
import 'events.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpUseCase otpUseCase;

  OtpBloc(this.otpUseCase) : super(OtpInitialState()) {
    on((event, emit) async {
      if (event is OtpExecuteEvent) {
        emit(OtpLoadingState());
        var stringOrFailure = await otpUseCase(event.otpRequest);
        stringOrFailure.fold((l) {
          emit(OtpErrorState(l.message));
        }, (r)  {
          emit(OtpSuccessState(r));
        });
      }
    });
  }
}
