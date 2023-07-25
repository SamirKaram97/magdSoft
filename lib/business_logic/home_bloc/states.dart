import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';

import '../../data/models/HelpModel.dart';
import '../../data/models/product_model.dart';

abstract class ProductsState{}

class ProductsInitialState extends ProductsState{}

class ProductsSuccessState extends ProductsState{
  final List<ProductModel> products;
  ProductsSuccessState(this.products);
}
class ProductsLoadingState extends ProductsState{}

class ProductsErrorState extends ProductsState{
  final String message;

  ProductsErrorState(this.message);
}

class ProductsChangeSelectedIndexState extends ProductsState{}
class ProductsAddedToFavState extends ProductsState{
  final int id;

  ProductsAddedToFavState(this.id);
}
class ProductsRemovedFromFavState extends ProductsState{
  final int id;

  ProductsRemovedFromFavState(this.id);
}
