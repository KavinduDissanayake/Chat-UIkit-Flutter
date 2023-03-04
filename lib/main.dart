import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/constants/app_colors.dart';
import 'new/screen/main_tab_bar/main_tab_bar.dart';


void main() => runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
    const MyApp()
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    GetMaterialApp getXApp = GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
      primaryColor: AppColors.primaryColor
      ),
      home: MainTabBar(),
      // initialBinding: AppBinding(),
    );

    return getXApp;

  }
}
