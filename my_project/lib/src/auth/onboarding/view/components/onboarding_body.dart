import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/src/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key, required this.controller}) : super(key: key);
  final OnboardingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20), // Added space above text

        Expanded(
          child: BlocProvider<OnboardingControllerCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingControllerCubit,
                OnboardingControllerState>(
              builder: (context, state) {
                OnboardingControllerCubit controller =
                    context.read<OnboardingControllerCubit>();

                return PageView(
                  controller: controller.pageController,
                  children: List.generate(controller.data.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///image
                        SizedBox(
                          width: 1000, // Adjusted width
                          height: 500, // Adjusted height
                          child: Image.asset(
                            controller.data[index].image,
                            fit: BoxFit.contain, // Maintain aspect ratio
                          ),
                        ),

                        ///title
                        Center(
                          child: Text(
                            controller.data[index].title,
                            style: const TextStyle(
                              fontSize: 18, // Adjusted font size
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 110, 110, 110),
                            ),
                          ),
                        ),

                        ///subtitle
                      ],
                    );
                  }),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
