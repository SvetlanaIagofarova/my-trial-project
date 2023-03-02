import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/domain/entity/comics.dart';

class ComicDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int comicId;
  Comics? _comicDetails;
  Comics? get comicDetails => _comicDetails;

  late DateFormat _dateFormat;

  ComicDetailsModel(this.comicId);

  Future<void> loadComicDetails(BuildContext context) async {
    try {
      _dateFormat = DateFormat.yMMMd();
      _comicDetails = await _apiClient.comicDetails(comicId);
      // _comicDetails = _comicDetailsWrapper.data.comics.firstWhere(
      //   (comic) => comic.id == comicId,
      // );
      notifyListeners();
    } catch (e) {
      print('smth bad happened');
    }
  }
}
