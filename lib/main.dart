import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:movieapp/Views/bottom_appbar.dart';

void main() {
  Get.put(MovieController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          title: 'Assignment Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            useMaterial3: true,
          ),
          home: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
