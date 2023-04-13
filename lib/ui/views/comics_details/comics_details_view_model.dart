import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/entity/comic.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';
import 'package:my_trial_project/domain/services/comic_service.dart';

class ComicDetailsViewModel extends ChangeNotifier {
  final _comicService = ComicService();
  final int comicId;

  Comic? _comicDetails;
  Comic? get comicDetails => _comicDetails;

  final _seriesOfComics = <Comic>[];
  List<Comic> get seriesOfComics => List.unmodifiable(_seriesOfComics);

  WrapperObject? _comicDetailsWrapper;
  WrapperObject? get comicDetailsWrapper => _comicDetailsWrapper;

  late DateFormat _dateFormat;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  ComicDetailsViewModel(this.comicId);

  Future<void> loadComicDetails() async {
    try {
      _dateFormat = DateFormat.yMMMd();
      _comicDetailsWrapper = await _comicService.comicDetails(comicId);
      _comicDetails = _comicDetailsWrapper?.data.comic.firstWhere(
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
      final seriesResponse = await _comicService.seriesOfComic(
          _comicDetails?.series?.resourceURI ??
              'https://gateway.marvel.com/v1/public/series/34718');
      _seriesOfComics.addAll(seriesResponse.data.comic);
      notifyListeners();
    } catch (e) {
      print('smth bad with series happened');
    }
  }

}
