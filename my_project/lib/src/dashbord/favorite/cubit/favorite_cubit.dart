// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_project/src/dashbord/modules/product/cubit/product_cubit.dart';
import 'package:my_project/src/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:my_project/src/dashbord/modules/product/model/repo/database_repo.dart';

part 'favorite_state.dart';

class favoriteCubit extends Cubit<favoriteState> {
  static favoriteCubit instance = favoriteCubit();
  favoriteCubit() : super(favoriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DataBaseRepo repo = DataBaseRepo();

  void init() async {
    emit(favoriteStateLoading());
    await repo.intiDB();
    products = await repo.fetchFavoriteProducts();

    if (products.isEmpty) {
      emit(favoriteStateEmpty());
    } else {
      emit(favoriteStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    ProductCubit.instance.init();
    emit(favoriteStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    init();
    ProductCubit.instance.init();
    emit(favoriteStateLoaded());
  }
}
