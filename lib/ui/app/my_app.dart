import 'package:my_trial_project/ui/navigation/main_navigation.dart';
import 'package:my_trial_project/ui/theme/main_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: MainTheme().mainTheme,
          debugShowCheckedModeBanner: false,
          routes: mainNavigation.routes,
          initialRoute: mainNavigation.initialRoute,
          onGenerateRoute: mainNavigation.onGenerateRoute,
        );
      },
    );
  }
}