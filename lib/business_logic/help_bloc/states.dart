import '../../data/models/HelpModel.dart';

abstract class HelpState{}

class HelpInitialState extends HelpState{}

class HelpSuccessState extends HelpState{
  final List<HelpModel> helpList;

  HelpSuccessState(this.helpList);


}
class HelpLoadingState extends HelpState{}

class HelpErrorState extends HelpState{
  final String message;

  HelpErrorState(this.message);
}
class ChangeIndexStateState extends HelpState{}
