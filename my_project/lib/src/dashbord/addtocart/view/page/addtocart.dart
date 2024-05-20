import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/src/dashbord/addtocart/cubit/addtocart_cubit.dart';
import 'package:my_project/src/dashbord/addtocart/view/component/addtocart_item.dart';
import 'package:my_project/src/dashbord/favorite/cubit/favorite_cubit.dart';
import 'package:my_project/src/dashbord/favorite/view/component/favorite_item.dart';
import 'package:my_project/src/dashbord/modules/product/cubit/product_cubit.dart';

class addtocartPage extends StatelessWidget {
  const addtocartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addtocartCubit(),
      child: BlocBuilder<addtocartCubit, addtocartState>(
        builder: (context, state) {
          final addtocartCubit controller = context.read<addtocartCubit>();
          return Scaffold(
            body: state is ProductStateLoaded
                ? const CircularProgressIndicator()
                : state is ProductStateEmpty
                    ? const Icon(CupertinoIcons.delete)
                    : ListView.builder(
                        itemBuilder: (_, int index) => AddToCartItem(
                          productModel: controller.products[index],
                          controller: controller,
                        ),
                        itemCount: controller.products.length,
                      ),
          );
        },
      ),
    );
  }
}
