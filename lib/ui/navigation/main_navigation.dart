import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/views/auth/login/login_view.dart';
import 'package:my_trial_project/ui/views/auth/register/register_view.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_widget.dart';
import 'package:my_trial_project/ui/views/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
  static const loginView = '/login_view';
  static const registerView = '/register_view';
  static const movieDetailsView = '/movie_details';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.mainScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
    MainNavigationRouteNames.loginView: (context) => const LoginView(),
    MainNavigationRouteNames.registerView: (context) => const RegisterView(),
    MainNavigationRouteNames.movieDetailsView: (context) => const MovieDetailsWidget(movieId: 0),
  };
}
