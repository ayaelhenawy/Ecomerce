// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_project/src/Sign%20Up.dart';
import 'package:my_project/src/auth/onboarding/model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(
        duration: const Duration(seconds: 2), curve: Curves.bounceIn);
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const SignUp(),
      ),
    );
  }

  List data = [
    OnboardingModel(
      image: 'assets/splash_1.png',
      title: 'Welcome to Tokoto, Let is shop !',
    ),
    OnboardingModel(
      image: 'assets/splash_2.png',
      title:
          'We help people conect with store \naround United State of America',
    ),
    OnboardingModel(
      image: 'assets/splash_3.png',
      title: 'We show the easy way to shop. \njust stay at home with us',
    ),
  ];
}
