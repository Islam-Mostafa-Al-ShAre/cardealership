import 'package:flutter_test/flutter_test.dart';
import 'package:cardealership/utils/constants/text_strings.dart'; // replace with your actual path

void main() {
  group('AppTexts Tests', () {
    test('Drawer Home Text', () {
      expect(AppTexts.drawerHome, "Home");
    });

    test('Onboarding Page Text', () {
      expect(AppTexts.onboardingPage, "/onboarding");
    });

    test('Buy Text', () {
      expect(AppTexts.buy, "Buy");
    });

    // Add more tests for the other texts...
  });
}
