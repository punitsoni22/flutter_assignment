import 'package:flutter/material.dart';
import 'package:flutter_assignment/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(375, 812),
    builder: (context, child) {
      return const MyApp();
    },
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.home,
        getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}