import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart'
    as previous_provider;
import 'package:my_trial_project/ui/views/comics_details/comics_details_view_model.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_widget.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_view_model.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_widget.dart';
import 'package:my_trial_project/ui/views/main_screen/main_screen_widget.dart';
import 'package:my_trial_project/ui/views/news/news_widget.dart';
import 'package:my_trial_project/ui/views/tv_show_list/tv_show_list_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainScreen() {
    return const MainScreenWidget();
  }

  Widget makeComicDetailsScreen(int comicsId) {
    return previous_provider.NotifierProvider(
      create: () => ComicDetailsViewModel(comicsId),
      child: const ComicsDetailsWidget(),
    );
  }

  Widget makeNewsWidget() {
    return const NewsWidget();
  }

  Widget makeComicListWidget() {
    return ChangeNotifierProvider(
      create: (_) => ComicsListViewModel(),
      child: const ComicsListWidget(),
    );
  }

  Widget makeTVShowWidget() {
    return const TVShowListWidget();
  }
}
