import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/ThemeToggleIcon.dart';

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
          title: Text('Enter Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter quantity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (quantityController.text.isNotEmpty) {
                  final quantity = int.tryParse(quantityController.text);
                  if (quantity != null && quantity > 0) {
                    // Implement your purchase logic here with the entered quantity
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You have purchased $quantity item(s)'),
                      ),
                    );
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a valid quantity'),
                      ),
                    );
                  }
                }
              },
              child: Text('Purchase'),
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
        title: Text('Product Details'),
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
                          "T-Shirt",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Classic men Shirt",
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
                      child: const Text("Purchase"),
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
