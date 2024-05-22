// ignore_for_file: camel_case_types, use_super_parameters

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/ThemeToggleIcon.dart';
import 'package:my_project/core2/lang/cubit/parent_cubit.dart';

class product_screen extends StatelessWidget {
  product_screen({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/photo_2024-05-02_22-48-37.jpg",
    "assets/photo_2024-05-02_22-48-34.jpg",
    "assets/photo_2024-05-02_22-48-39.jpg",
    "assets/photo_2024-05-02_22-48-36.jpg",
  ];

  void _showQuantityDialog(BuildContext context) {
    final TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            ParentCubit.instance.local['enter_quantity'] ?? 'Enter Quantity',
          ),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: ParentCubit.instance.local['enter_quantity'] ??
                  'Enter quantity',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                ParentCubit.instance.local['cancel'] ?? 'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                if (quantityController.text.isNotEmpty) {
                  final quantity = int.tryParse(quantityController.text);
                  if (quantity != null && quantity > 0) {
                    // Implement your purchase logic here with the entered quantity
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${ParentCubit.instance.local['you_have_purchased']} $quantity ${ParentCubit.instance.local['items']}',
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          ParentCubit.instance
                                  .local['please_enter_valid_quantity'] ??
                              'Please enter a valid quantity',
                        ),
                      ),
                    );
                  }
                }
              },
              child: Text(
                ParentCubit.instance.local['purchase'] ?? 'Purchase',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          ParentCubit.instance.local['product_details'] ?? 'Product Details',
        ),
        backgroundColor: Color.fromARGB(255, 253, 214, 222),
        actions: [
          ThemeToggleIcon(), // Add the ThemeToggleIcon here
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FanCarouselImageSlider(
                    sliderHeight: 430,
                    autoPlay: true,
                    imagesLink: images,
                    isAssets: true,
                  ),
                ),
                SizedBox(height: 30), // Added space between carousel and text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ParentCubit.instance.local['t_shirt'] ?? 'T-Shirt',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ParentCubit.instance.local['classic_men_shirt'] ??
                              'Classic men Shirt',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showQuantityDialog(context);
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
