
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_calculator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(100, 1000),
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.globalKey,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),/*
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            fillColor: Colors.white,
            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
            border: OutlineInputBorder(borderSide: BorderSide.none,),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),*/
        ),
        home: const BmiCalculator(),
      ),
    );
  }
}
