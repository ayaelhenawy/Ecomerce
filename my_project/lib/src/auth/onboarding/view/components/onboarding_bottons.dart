import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/src/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingButtonWidget extends StatelessWidget {
  const OnboardingButtonWidget({super.key, required this.controller});
  final OnboardingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingControllerCubit>.value(
      value: controller,
      child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
        builder: (context, state) {
          OnboardingControllerCubit controller =
              context.read<OnboardingControllerCubit>();

          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.onCallSkip(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Background color
                    disabledBackgroundColor: Colors.black, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Skip"),
                ),
                ElevatedButton(
                  onPressed: controller.onChangeToNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 253, 198, 198), // Background color
                    disabledBackgroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
