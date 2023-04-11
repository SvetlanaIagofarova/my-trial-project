import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/domain/entity/comics.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';

class ComicDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int comicId;

  Comics? _comicDetails;
  Comics? get comicDetails => _comicDetails;

  final _seriesOfComics = <Comics>[];
  List<Comics> get seriesOfComics => List.unmodifiable(_seriesOfComics);

  WrapperObject? _comicDetailsWrapper;
  WrapperObject? get comicDetailsWrapper => _comicDetailsWrapper;

  late DateFormat _dateFormat;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  ComicDetailsModel(this.comicId);

  Future<void> loadComicDetails() async {
    try {
      _dateFormat = DateFormat.yMMMd();
      _comicDetailsWrapper = await _apiClient.comicDetails(comicId);
      _comicDetails = _comicDetailsWrapper?.data.comics.firstWhere(
        (comic) => comic.id == comicId,
      );
      loadSeriesOfComic();
      notifyListeners();
    } catch (e) {
      print('smth bad happened');
    }
  }

  Future<void> loadSeriesOfComic() async {
    try {
      final seriesResponse = await _apiClient.seriesOfComic(
          _comicDetails?.series?.resourceURI ??
              'https://gateway.marvel.com/v1/public/series/34718');
      _seriesOfComics.addAll(seriesResponse.data.comics);
      notifyListeners();
    } catch (e) {
      print('smth bad with series happened');
    }
  }

}
