import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bag_about_us/screens/home_screen.dart';
import 'package:bag_about_us/theme/app_theme.dart';
import 'package:bag_about_us/controllers/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize theme controller
    final ThemeController themeController = Get.put(ThemeController());
    
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'BAG Guild About Us',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          home: HomeScreen(), // Removed const keyword
        );
      }
    );
  }
}
