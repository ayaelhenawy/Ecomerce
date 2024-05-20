import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/src/dashbord/modules/product/cubit/product_cubit.dart';
import 'package:my_project/src/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:my_project/src/dashbord/product_screen/product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
    required this.controller,
  }) : super(key: key);

  final ProductModel productModel;
  final ProductCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 247, 247),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Product info
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => product_screen(),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.memory(
                        productModel.image ?? Uint8List(10),
                        height: 170,
                        width: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.name ?? 'Product',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            productModel.desc ?? 'Description',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Price: ${productModel.availableQuantity ?? 0}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 1, height: 32),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      productModel.favorite == 1
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color:
                          productModel.favorite == 1 ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      int newFavoriteValue = productModel.favorite == 1 ? 0 : 1;
                      controller.addItemToFavorite(
                          productModel.id ?? 0, newFavoriteValue);
                    },
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.cart,
                      color: productModel.cart == 1
                          ? Color.fromARGB(255, 253, 168, 168)
                          : Colors.grey,
                    ),
                    onPressed: () {
                      int newCartValue = productModel.cart == 1 ? 0 : 1;
                      controller.addItemToCart(
                          productModel.id ?? 0, newCartValue);
                      // Show a snackbar based on the value of productModel.cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            productModel.cart == 0
                                ? 'One item added to cart.'
                                : 'Deleted.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
