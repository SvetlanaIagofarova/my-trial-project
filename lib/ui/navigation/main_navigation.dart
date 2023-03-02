import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/auth/login/login_view.dart';
import 'package:my_trial_project/ui/views/auth/register/register_view.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_model.dart';
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
    MainNavigationRouteNames.mainScreen: (context) => NotifierProvider(
          create: () => MainScreenModel(),
          child: const MainScreenWidget(),
        ),
    MainNavigationRouteNames.loginView: (context) => const LoginView(),
    MainNavigationRouteNames.registerView: (context) => const RegisterView(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.comicsDetailsView:
        final arguments = settings.arguments;
        final comicsId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => NotifierProvider(
            create: () => ComicDetailsModel(comicsId),
            child: const ComicsDetailsWidget(),
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}

  //  if (settings.name == MainNavigationRouteNames.comicsDetailsView) {
  //     return _buildRoute(
  //       settings, () => MainNavigationRouteNames.comicsDetailsView,
  //     );
  //   } else {
  //     MaterialPageRoute<dynamic>(
  //       builder: (context) => const Text('Navigation error!!!'),
  //     );
  //   }
  // }

  // MaterialPageRoute _buildRoute(RouteSettings settings, dynamic route) {
  //   return new MaterialPageRoute<dynamic>(
  //     settings: settings,
  //     builder: (ctx) => NotifierProvider(
  //       create: () => ComicDetailsModel(settings.arguments as int),
  //       child: const ComicsDetailsWidget(),
  //     ),
  //   );
  // }
