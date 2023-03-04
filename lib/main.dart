import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/constants/app_colors.dart';
import 'new/screen/main_tab_bar/main_tab_bar.dart';

//for test different screen size
// void main() => runApp(
//       DevicePreview(
//         enabled: true,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() => runApp(
    const MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    GetMaterialApp getXApp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
      primaryColor: AppColors.primaryColor
      ),
      home: MainTabBar(),
    );

    return getXApp;

  }
}
