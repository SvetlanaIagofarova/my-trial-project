import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
  static const comicsDetailsView = '/comics_details';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.comicsDetailsView:
        final arguments = settings.arguments;
        final comicsId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeComicDetailsScreen(comicsId),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
