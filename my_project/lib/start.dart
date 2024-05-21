import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/ThemeToggleIcon.dart';
import 'package:my_project/src/Login.dart';
import 'package:my_project/src/Sign%20Up.dart';

class Start extends StatelessWidget {
  Start({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/bag.png",
    "assets/geans.png",
    "assets/images.jpeg",
    "assets/aaa.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Color.fromARGB(255, 172, 172, 172),
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
                SizedBox(height: 20), // Added space between carousel and text
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 60, // Set the width of the button
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 252, 229, 229),
                          ), // Set button background color
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 87, 87, 87), // Set text color to white
                            fontSize: 17, // Set font size
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 60, // Set the width of the button
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 252, 229, 229),
                          ), // Set button background color
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login ',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 87, 87, 87), // Set text color to white
                            fontSize: 17, // Set font size
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
