import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/HelpModel.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/get_help_response.dart';

import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/network/faliure.dart';

abstract class DataRepository
{
  Future<Either<Failure, List<HelpModel>>> getHelp();
}

class DataRepositoryImpl implements DataRepository
{
  @override
  Future<Either<Failure, List<HelpModel>>> getHelp()async {
    try {
      var responseData = await DioHelper.getData(
        query: {},
          url: getHelpBP);

      GetHelpResponse getHelpResponse=GetHelpResponse.fromJson(responseData.data);
      print(getHelpResponse.toJson());

      if(getHelpResponse.status==200)
      {
        List<HelpModel> list=getHelpResponse.help?.map((e) => HelpModel.fromJson(e.toJson())).toList()??[];
        return right(list);
      }
      else {
        return left(Failure("error", 400));
      }
    } catch (e) {
      print(e.toString());
      return left(Failure(e.toString(), 400));
    }

  }

}