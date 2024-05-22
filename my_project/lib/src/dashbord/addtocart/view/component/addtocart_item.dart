import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core2/lang/cubit/parent_cubit.dart';
import 'package:my_project/src/dashbord/addtocart/cubit/addtocart_cubit.dart';
import 'package:my_project/src/dashbord/favorite/cubit/favorite_cubit.dart';
import 'package:my_project/src/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:my_project/src/dashbord/product_screen/product_screen.dart'; // Import the product_screen.dart file

class AddToCartItem extends StatelessWidget {
  const AddToCartItem({
    Key? key,
    required this.productModel,
    required this.controller,
  }) : super(key: key);

  final ProductModel productModel;
  final addtocartCubit controller;

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
              // Product Info
              GestureDetector(
                // Wrap the image with GestureDetector
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          product_screen(), // Navigate to product_screen and pass productModel
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
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.name ??
                                ParentCubit.instance.local['product'] ??
                                'Product',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            productModel.desc ??
                                ParentCubit.instance.local['description'] ??
                                'Description',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${ParentCubit.instance.local['price'] ?? 'Price'}: ${productModel.availableQuantity ?? 0}',
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
                  ElevatedButton(
                    onPressed: () {
                      // Show a dialog for selecting the quantity
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          int quantity = 1; // Initial quantity
                          return AlertDialog(
                            title: Text(
                              ParentCubit.instance.local['select_quantity'] ??
                                  'Select Quantity',
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    // Parse the value of the text field to an integer
                                    quantity = int.tryParse(value) ?? 1;
                                  },
                                  decoration: InputDecoration(
                                    labelText: ParentCubit
                                            .instance.local['quantity'] ??
                                        'Quantity',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  // Perform an action with the selected quantity
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          ParentCubit.instance
                                                  .local['purchase_complete'] ??
                                              'Purchase Complete',
                                        ),
                                        content: Text(
                                          '${ParentCubit.instance.local['purchase_success']} $quantity ${ParentCubit.instance.local['items'] ?? 'items'}.',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              ParentCubit
                                                      .instance.local['ok'] ??
                                                  'OK',
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  ParentCubit.instance.local['confirm'] ??
                                      'Confirm',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  ParentCubit.instance.local['cancel'] ??
                                      'Cancel',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      ParentCubit.instance.local['purchase'] ?? 'Purchase',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 232, 223),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.delete,
                      color: productModel.cart == 1
                          ? Color.fromARGB(255, 255, 160, 160)
                          : Colors.grey,
                    ),
                    onPressed: () {
                      int newCartValue = productModel.cart == 1 ? 0 : 1;
                      controller.addItemToCart(
                          productModel.id ?? 0, newCartValue);
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
