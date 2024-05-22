import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core2/lang/cubit/parent_cubit.dart';
import 'package:my_project/src/dashbord/new_product/cubit/new_product_cubit.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
          final NewProductCubit cubit = context.read<NewProductCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                ParentCubit.instance.local['add_new_product'] ??
                    'Add New Product',
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 255, 219, 219),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ParentCubit.instance.local['product_name'] ??
                        'Product Name',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    controller: cubit.nameController,
                    decoration: InputDecoration(
                      hintText:
                          ParentCubit.instance.local['enter_product_name'] ??
                              'Enter product name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    ParentCubit.instance.local['description'] ?? 'Description',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    controller: cubit.desController,
                    decoration: InputDecoration(
                      hintText: ParentCubit
                              .instance.local['enter_product_description'] ??
                          'Enter product description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    ParentCubit.instance.local['price'] ?? 'Price',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: cubit.qnController,
                    decoration: InputDecoration(
                      hintText:
                          ParentCubit.instance.local['enter_product_price'] ??
                              'Enter product Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    ParentCubit.instance.local['product_image'] ??
                        'Product Image',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: cubit.pickProductImage,
                        icon: const Icon(Icons.photo,
                            color: Color.fromARGB(255, 255, 232, 223)),
                      ),
                      IconButton(
                        onPressed: cubit.takeProductImage,
                        icon: const Icon(Icons.camera_alt,
                            color: Color.fromARGB(255, 255, 232, 223)),
                      ),
                    ],
                  ),
                  if (cubit.image != null)
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(cubit.image!.path),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 32.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => cubit.addProduct(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 232, 223),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        ParentCubit.instance.local['add_product'] ??
                            'Add Product',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
