import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/domain/entity/comics.dart';
import 'package:my_trial_project/ui/navigation/main_navigation.dart';

class ComicsListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _comics = <Comics>[];
  List<Comics> get comics => List.unmodifiable(_comics);
  final _dateFormat = DateFormat.yMMMd();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadComics() async {
    final comicsResponse = await _apiClient.latestComics(
      'thisMonth',
      20,
    );
    _comics.addAll(comicsResponse.data.comics);
    notifyListeners();
  }

  void onComicsTap(BuildContext context, int index) {
    final id = _comics[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.comicsDetailsView,
      arguments: id,
    );
  }
}
