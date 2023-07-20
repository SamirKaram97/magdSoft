import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/login_usecase.dart';
import 'package:magdsoft_flutter_structure/data/models/HelpModel.dart';

import '../usecase/get_help_usecase.dart';
import 'events.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final GetHelpUseCase getHelpUseCase;
  int selectedIndex=0;
  List<HelpModel>? helpList;

  HelpBloc(this.getHelpUseCase) : super(HelpInitialState()) {
    on((event, emit) async {
      if (event is HelpExecuteEvent) {
        emit(HelpLoadingState());
        var listOrFailure = await getHelpUseCase();
        listOrFailure.fold((l) {
          emit(HelpErrorState(l.message));
        }, (r)  {
          helpList=r;
          emit(HelpSuccessState(r));
        });
      }
    });
  }

  void changeSelectedIndex(int index)
  {
    if(selectedIndex==index) {
      selectedIndex=-1;
      emit(ChangeIndexStateState());
    } else {
      selectedIndex =index;
      emit(ChangeIndexStateState());
    }
  }
}
