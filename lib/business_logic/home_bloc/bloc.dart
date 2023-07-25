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
  List<ProductModel>? acer;
  List<ProductModel>? razer;

  List<int> favList = [];
  int selectedIndex = 0;

  ProductsBloc(this.getProductUseCase) : super(ProductsInitialState()) {
    on((event, emit) async {
      if (event is GetProductsExecuteEvent) {
        emit(ProductsLoadingState());
        var listOrFailure = await getProductUseCase();
        listOrFailure.fold((l) {
          emit(ProductsErrorState(l.message));
        }, (r) {
          acer = [];
          razer = [];
          r.forEach((element) {
            if (element.company == "Acer") {
              acer!.add(element);
            } else if (element.company == 'Razer') {
              razer!.add(element);
            } else {

            }
            print(element.company == 'Razer');
            print(razer);
          });
          productsList = r;
          emit(ProductsSuccessState(r));
        });
      }
    });
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ProductsChangeSelectedIndexState());
  }

  Future addToFav(int id) async {
    if (favList.contains(id)) {
      favList.remove(id);
      emit(ProductsRemovedFromFavState(id));
    } else {
      favList.add(id);
      emit(ProductsAddedToFavState(id));
    }
    await CacheHelper.saveDataSharedPreference(
        key: "fav", value: jsonEncode(favList));

  }

  void getFav() {
    String? stringFavList = CacheHelper.getDataFromSharedPreference(key: "fav");
    if (stringFavList != null) {
      favList = json.decode(stringFavList).cast<int>();
    }

    print(favList);
  }
}
