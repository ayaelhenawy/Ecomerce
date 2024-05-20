import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/src/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key, required this.controller});
  final OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Welcome in our App"),
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
                        Image.asset(controller.data[index].image),

                        ///title
                        Text(
                          controller.data[index].title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
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