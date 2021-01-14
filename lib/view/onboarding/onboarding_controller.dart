import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class OnboardingController extends GetxController {

  var onboardingSelectedPage = 0.obs;

  setOnboardingSelectedPage(value) => onboardingSelectedPage.value = value;

  final listOnboarding = [
    OnboardingItem('Hello, there!\nWelcome to KuKelola.', 'assets/images/onboarding1.png', 'Easily managing your data, your working companion.'),
    OnboardingItem('All your needs in one touch.', 'assets/images/onboarding2.svg', 'Manage your personal data, attendance and even salary in one app.'),
    OnboardingItem('Get ready to start!', 'assets/images/onboarding3.svg', 'Now sign in to your account and experience KuKelola!'),
  ];
}