import 'package:dartz/dartz.dart';


import '../../data/models/product_model.dart';
import '../../data/network/faliure.dart';
import '../services/data_services.dart';

class GetProductUseCase
{
  final DataServices dataServices;

  GetProductUseCase(this.dataServices);

  Future<Either<Failure, List<ProductModel>>> call() async
  {
    return await dataServices.getProducts();
  }
}
