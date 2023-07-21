import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/get_products_usecase.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/login_usecase.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

import '../usecase/get_help_usecase.dart';
import 'events.dart';

class ProductsBloc extends Bloc<GetProductsEvent, ProductsState> {
  final GetProductUseCase getProductUseCase;
  List<ProductModel>? productsList;
  List<int> favList=[];
  int selectedIndex=0;

  ProductsBloc(this.getProductUseCase) : super(ProductsInitialState()) {
    on((event, emit) async {
      if (event is GetProductsExecuteEvent) {
        emit(ProductsLoadingState());
        var listOrFailure = await getProductUseCase();
        listOrFailure.fold((l) {
          emit(ProductsErrorState(l.message));
        }, (r)  {
          productsList=r;
          emit(ProductsSuccessState(r));
        });
      }
    });
  }



  void changeSelectedIndex(int index)
  {
    selectedIndex=index;
    emit(ProductsChangeSelectedIndexState());
  }

  Future addToFav(int id)async
  {
    if(favList.contains(id))
      {
        favList.remove(id);
      }
    else
      {
        favList.add(id);
      }
    await CacheHelper.saveDataSharedPreference(key: "fav", value: jsonEncode(favList));
    emit(ProductsAddtoFavState(id));
  }


  void getFav()
  {
    String? stringFavList=CacheHelper.getDataFromSharedPreference(key: "fav");
    if(stringFavList!=null)
      {
        favList=json.decode(stringFavList).cast<int>();
      }

    print(favList);
  }
}
