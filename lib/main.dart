import 'package:boycot/injection.dart';
import 'package:boycot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/router.dart';
import 'core/constants/app_colors.dart';

void main() async{
  await setupServiceLocator();
  runApp(
    Injection(child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.scaffoldBackground,
              primary: AppColors.primaryGreen,
            ),
          ),
          routerConfig: router,
        );
      }
    );
  }
}
