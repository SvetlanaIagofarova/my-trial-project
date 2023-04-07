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
  int _currentOffset = 0;
  int _totalNumber = 1;
  var _isLoadingInProgress = false;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadComics() async {
    if (_isLoadingInProgress || _currentOffset >= _totalNumber) return;
    _isLoadingInProgress = true;
    final nextOffset = _currentOffset + 20;
    try {
      final comicsResponse = await _apiClient.latestComics(
        'thisMonth',
        nextOffset,
        true,
        '-onsaleDate',
      );
      _comics.addAll(comicsResponse.data.comics);
      _currentOffset = comicsResponse.data.offset;
      _totalNumber = comicsResponse.data.total;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
      print('Generate showErrorDialog');
    }
  }

  void onComicsTap(BuildContext context, int index) {
    final id = _comics[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.comicsDetailsView,
      arguments: id,
    );
  }

  void showComicsByIndex(int index) {
    if (index < _comics.length - 3) return;
    loadComics();
  }
}
