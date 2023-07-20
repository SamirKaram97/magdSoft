import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/data_repo.dart';


import '../../data/models/product_model.dart';
import '../../data/network/faliure.dart';

class GetProductUseCase
{
  final DataRepository dataRepository;

  GetProductUseCase(this.dataRepository);

  Future<Either<Failure, List<ProductModel>>> call() async
  {
    return await dataRepository.getProducts();
  }
}
