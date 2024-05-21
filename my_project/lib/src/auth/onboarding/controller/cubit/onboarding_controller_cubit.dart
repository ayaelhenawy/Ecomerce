// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_project/src/Sign%20Up.dart';
import 'package:my_project/src/auth/onboarding/model/onboarding_model.dart';
import 'package:my_project/start.dart';
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
        builder: (BuildContext context) => Start(),
      ),
    );
  }

  List data = [
    OnboardingModel(
      image: 'assets/a1.jpg',
      title: 'Welcome to Tokoto, Let is shop !',
    ),
    OnboardingModel(
      image: 'assets/a2.jpg',
      title: 'Black Friday Sale',
    ),
    OnboardingModel(
      image: 'assets/a3.jpg',
      title: 'We show the easy way to shops',
    ),
  ];
}
