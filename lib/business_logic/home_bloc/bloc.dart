import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/layout_cubit/layout_cubit.dart';
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

  int selectedCategoryIndex = 0;

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

  void changeSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    emit(ProductsChangeSelectedIndexState());
  }

  void changeFav(context,int id)async
  {
    await LayoutCubit.get(context).addProductToFav(id);
    emit(ChangeFavState());
  }
}
