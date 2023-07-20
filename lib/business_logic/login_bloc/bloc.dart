import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/login_usecase.dart';

import 'events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on((event, emit) async {
      if (event is LoginExecuteEvent) {
        emit(LoginLoadingState());
        var stringOrFailure = await loginUseCase(event.loginRequest);
        stringOrFailure.fold((l) {
          emit(LoginErrorState(l.message));
        }, (r)  {
          emit(LoginSuccessState(r));
        });
      }
    });
  }
}
