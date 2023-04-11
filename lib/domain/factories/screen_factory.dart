import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart'
    as previous_provider;
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_widget.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_model.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_widget.dart';

class ScreenFactory {
  Widget makeMainScreen() {
    return previous_provider.NotifierProvider(
      create: () => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeComicDetailsScreen(int comicsId) {
    return previous_provider.NotifierProvider(
      create: () => ComicDetailsModel(comicsId),
      child: const ComicsDetailsWidget(),
    );
  }
}
