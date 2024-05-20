import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_project/src/dashbord/favorite/cubit/favorite_cubit.dart';
import 'package:my_project/src/dashbord/modules/product/cubit/product_cubit.dart';
import 'package:my_project/src/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:my_project/src/dashbord/modules/product/model/repo/database_repo.dart';

part 'addtocart_state.dart';

class addtocartCubit extends Cubit<addtocartState> {
  static addtocartCubit instance = addtocartCubit();
  addtocartCubit() : super(addtocartStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DataBaseRepo repo = DataBaseRepo();

  void init() async {
    emit(addtocartStateLoading());
    await repo.intiDB();
    products = await repo.fetchCartProducts();

    if (products.isEmpty) {
      emit(addtocartStateEmpty());
    } else {
      emit(addtocartStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    ProductCubit.instance.init();
    emit((addtocartStateLoaded()));
  }

  void addItemToCart(int id, int value) {
    repo.updateCart(value, id);
    init();
    ProductCubit.instance.init();
    emit(addtocartStateLoaded());
  }
}
