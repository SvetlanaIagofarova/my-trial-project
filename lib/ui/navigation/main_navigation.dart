import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/views/auth/login/login_view.dart';
import 'package:my_trial_project/ui/views/auth/register/register_view.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
  static const loginView = '/login_view';
  static const registerView = '/register_view';
  static const comicsDetailsView = '/comics_details';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.mainScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
    MainNavigationRouteNames.loginView: (context) => const LoginView(),
    MainNavigationRouteNames.registerView: (context) => const RegisterView(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.comicsDetailsView:
        final arguments = settings.arguments;
        final comicsId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => ComicsDetailsWidget(comics: comicsId),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
