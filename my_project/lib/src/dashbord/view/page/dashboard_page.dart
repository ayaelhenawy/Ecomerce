import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/src/dashbord/addtocart/view/page/addtocart.dart';
import 'package:my_project/src/dashbord/cubit/dashboard_cubit.dart';
import 'package:my_project/src/dashbord/favorite/view/page/favorite_page.dart';
import 'package:my_project/src/dashbord/modules/product/view/page/product_page.dart';
import 'package:my_project/src/dashbord/new_product/view/page/new_product_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cont = context.read<DashboardCubit>();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(70.0), // Height including padding
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0), // Padding from bottom
                child: AppBar(
                  backgroundColor: Color.fromARGB(
                      255, 250, 250, 250), // Custom background color
                  elevation: 8, // Elevation for shadow effect
                  shadowColor: Colors.black.withOpacity(0.5), // Shadow color
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/ecommerce-checkout-logo-white-grey-background_162944-7227.jpg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // Navigate to the NewProductPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewProductPage()),
                        );
                      },
                      icon:
                          const Icon(CupertinoIcons.plus, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            body: PageView(
              controller: cont.pageController,
              onPageChanged: cont.onChangeTap,
              children: const [
                ProductPage(),
                favoritePage(),
                addtocartPage(),
                Center(child: Text('Profile')),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color.fromARGB(255, 248, 156, 156),
              unselectedItemColor: Colors.grey,
              currentIndex: cont.currentIndex,
              onTap: cont.onChangeTap,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.collections), label: 'Product'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              ],
            ),
          );
        },
      ),
    );
  }
}
