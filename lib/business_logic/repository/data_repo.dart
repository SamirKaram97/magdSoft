import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/HelpModel.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/get_help_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import '../../data/data_providers/local/cache_helper.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/network/faliure.dart';

abstract class DataRepository
{
  Future<Either<Failure, List<HelpModel>>> getHelp();
  Future<Either<Failure, List<ProductModel>>> getProducts();
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

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts()async {

    try {
      var responseData = await DioHelper.getData(
          query: {},
          url: getProductsBP);

      ProductsResponse productsResponse=ProductsResponse.fromJson(responseData.data);
      print(productsResponse.toJson());

      if(productsResponse.status==200)
      {
        List<ProductModel> list=productsResponse.products?.map((e) => ProductModel.fromJson(e.toJson())).toList()??[];
        //CacheHelper.saveDataSharedPreference(key: "products", value: json.encode(list));
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