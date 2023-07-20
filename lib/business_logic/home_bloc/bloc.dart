import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/get_products_usecase.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/login_usecase.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

import '../usecase/get_help_usecase.dart';
import 'events.dart';

class ProductsBloc extends Bloc<GetProductsEvent, ProductsState> {
  final GetProductUseCase getProductUseCase;
  List<ProductModel>? productsList;

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

}
