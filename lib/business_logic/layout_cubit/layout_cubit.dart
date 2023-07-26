import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_providers/local/cache_helper.dart';
import 'layout_state.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  List<int> favList = [];
  int selectedBottomIndex=4;



  void changeSelectedBottomIndex(int index) {
    selectedBottomIndex = index;
    emit(LayoutChangeSelectedBottomIndexState());
  }


  Future addProductToFav(int id) async {
    if (favList.contains(id)) {
      favList.remove(id);
      emit(LayoutRemovedProductFromFavState());
    } else {
      favList.add(id);
      emit(LayoutAddedProductToFavState());
    }
    await CacheHelper.saveDataSharedPreference(
        key: "fav", value: jsonEncode(favList));

  }

  void getFavProducts() {
    String? stringFavList = CacheHelper.getDataFromSharedPreference(key: "fav");
    if (stringFavList != null) {
      favList = json.decode(stringFavList).cast<int>();
    }

    print(favList);
  }

}
