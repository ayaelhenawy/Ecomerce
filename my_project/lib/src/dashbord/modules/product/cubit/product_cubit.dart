import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_project/src/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:my_project/src/dashbord/modules/product/model/repo/database_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();
  ProductCubit() : super(ProductStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DataBaseRepo repo = DataBaseRepo();

  void init() async {
    emit(ProductStateLoading());
    await repo.intiDB();

    products = await repo.fetchProducts();

    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    emit(ProductStateLoaded());
  }

  void addItemToCart(int id, int value) {
    repo.updateCart(value, id);
    init();
    emit(ProductStateLoaded());
  }
}
