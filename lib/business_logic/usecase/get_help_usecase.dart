import 'package:dartz/dartz.dart';

import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../data/models/HelpModel.dart';
import '../../data/network/faliure.dart';
import '../services/data_services.dart';

class GetHelpUseCase
{
  final DataServices dataServices;

  GetHelpUseCase(this.dataServices);

  Future<Either<Failure, List<HelpModel>>> call() async
  {
    return await dataServices.getHelp();
  }
}
