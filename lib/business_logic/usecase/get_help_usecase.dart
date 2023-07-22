import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/data_services.dart';

import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../data/models/HelpModel.dart';
import '../../data/network/faliure.dart';

class GetHelpUseCase
{
  final DataServices dataServices;

  GetHelpUseCase(this.dataServices);

  Future<Either<Failure, List<HelpModel>>> call() async
  {
    return await dataServices.getHelp();
  }
}
