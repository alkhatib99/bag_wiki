import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable for dark mode state
  final RxBool isDarkMode = true.obs;
  
  // Toggle theme between light and dark
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
  
  // Set specific theme
  void setDarkMode(bool value) {
    isDarkMode.value = value;
  }
  
  // Check if device is in dark mode
  void checkDeviceTheme() {
    final brightness = Get.mediaQuery.platformBrightness;
    isDarkMode.value = brightness == Brightness.dark;
  }
}
