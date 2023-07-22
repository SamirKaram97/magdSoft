import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/data_services.dart';


import '../../data/models/product_model.dart';
import '../../data/network/faliure.dart';

class GetProductUseCase
{
  final DataServices dataServices;

  GetProductUseCase(this.dataServices);

  Future<Either<Failure, List<ProductModel>>> call() async
  {
    return await dataServices.getProducts();
  }
}
