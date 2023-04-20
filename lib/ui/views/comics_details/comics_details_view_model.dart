import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/entity/comic.dart';
import 'package:my_trial_project/domain/entity/comics/comic_date.dart';
import 'package:my_trial_project/domain/entity/comics/creator_summary.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';
import 'package:my_trial_project/domain/services/comic_service.dart';

class SeriesOfComicCreatorsNamesData {
  final String? creatorsNames;

  SeriesOfComicCreatorsNamesData({
    this.creatorsNames,
  });
}

class ComicDetailsCoverInformationData {
  final String? coloristCoverName;
  final String? inkerCoverName;
  final String? editorsName;
  final String? pencilerCoverName;

  ComicDetailsCoverInformationData({
    this.coloristCoverName,
    this.inkerCoverName,
    this.editorsName,
    this.pencilerCoverName,
  });
}

class ComicDetailsStoriesData {
  final String? writersName;
  final String? inkersName;
  final String? coloristsName;
  final String? letterersName;
  final String? pencilersName;
  final String? editorsName;

  ComicDetailsStoriesData({
    this.writersName,
    this.inkersName,
    this.coloristsName,
    this.letterersName,
    this.pencilersName,
    this.editorsName,
  });
}

class ComicDetailsExtendedCreditsAndInfoData {
  final String? formatValue;
  final String? priceValue;
  final String? upcValue;
  final String? focDateValue;

  ComicDetailsExtendedCreditsAndInfoData({
    this.formatValue,
    this.priceValue,
    this.upcValue,
    this.focDateValue,
  });
}

class ComicDetailsAuthorsAndDateDescriptionData {
  final String? onsaleDate;
  final String? writersNames;
  final String? pencilersNames;
  final String? coverArtistsNames;

  ComicDetailsAuthorsAndDateDescriptionData({
    this.onsaleDate,
    this.writersNames,
    this.pencilersNames,
    this.coverArtistsNames,
  });
}

class ComicDetailsImageData {
  final String? imagePath;
  final String? imageExtension;

  ComicDetailsImageData({
    this.imagePath,
    this.imageExtension,
  });
}

class ComicDetailsData {
  String title = '';
  bool isLoading = true;
  ComicDetailsImageData imageData = ComicDetailsImageData();
  ComicDetailsAuthorsAndDateDescriptionData authorsAndDate =
      ComicDetailsAuthorsAndDateDescriptionData();
  ComicDetailsExtendedCreditsAndInfoData extendedCreditsAndInfo =
      ComicDetailsExtendedCreditsAndInfoData();
  ComicDetailsStoriesData storiesData = ComicDetailsStoriesData();
  ComicDetailsCoverInformationData coverInformation =
      ComicDetailsCoverInformationData();
  SeriesOfComicCreatorsNamesData creatorsOfSeriesComicName =
      SeriesOfComicCreatorsNamesData();
}

class ComicDetailsViewModel extends ChangeNotifier {
  final _comicService = ComicService();
  final int comicId;
  final data = ComicDetailsData();

  Comic? _comicDetails;
  Comic? get comicDetails => _comicDetails;

  final _seriesOfComic = <Comic>[];
  List<Comic> get seriesOfComic => List.unmodifiable(_seriesOfComic);

  WrapperObject? _comicDetailsWrapper;
  WrapperObject? get comicDetailsWrapper => _comicDetailsWrapper;

  late DateFormat _dateFormat;

  ComicDetailsViewModel(this.comicId);

  void _updateDataOfComic(Comic? comicDetails) {
    data.title = comicDetails?.title ?? 'Loading...';
    data.isLoading = comicDetails == null;
    if (comicDetails == null) {
      notifyListeners();
      return;
    }

    final listOfCreators = comicDetails.creators?.items;
    final onSaleDate = comicDetails.dates?.map((i) => i.date).first;
    final focDate = comicDetails.dates
        ?.firstWhere((date) => date.type == 'focDate',
            orElse: () => ComicDate(
                  '',
                  DateTime.now(),
                ))
        .date;

    data.imageData = ComicDetailsImageData(
      imagePath: comicDetails.thumbnail?.path,
      imageExtension: comicDetails.thumbnail?.imageExtension,
    );

    data.authorsAndDate = ComicDetailsAuthorsAndDateDescriptionData(
      onsaleDate: onSaleDate != null ? _dateFormat.format(onSaleDate) : '',
      writersNames: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'writer' || item.role == 'writer (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      pencilersNames: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'inker' || item.role == 'penciler (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      coverArtistsNames: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'penciler (cover)',
            orElse: () => listOfCreators.firstWhere(
              (item) => item.role == 'inker (cover)',
              orElse: () => CreatorSummary('', 'unknown', ''),
            ),
          )
          .name,
    );

    data.extendedCreditsAndInfo = ComicDetailsExtendedCreditsAndInfoData(
      formatValue: comicDetails.format,
      priceValue: comicDetails.prices?.map((p) => p.price).last.toString(),
      upcValue: comicDetails.upc,
      focDateValue: focDate != null ? _dateFormat.format(focDate) : '',
    );

    data.storiesData = ComicDetailsStoriesData(
      writersName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'writer',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      inkersName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'inker',
            orElse: () => listOfCreators.firstWhere(
              (item) => item.role == 'inker (cover)',
              orElse: () => CreatorSummary('', 'unknown', ''),
            ),
          )
          .name,
      coloristsName: listOfCreators
          ?.firstWhere(
            (item) =>
                item.role == 'colorist' || item.role == 'colorist (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      letterersName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'letterer',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      pencilersName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'inker' || item.role == 'penciler (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      editorsName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'editor',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
    );
    data.coverInformation = ComicDetailsCoverInformationData(
      coloristCoverName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'colorist (cover)',
            orElse: () => listOfCreators.firstWhere(
              (item) =>
                  item.role == 'inker (cover)' ||
                  item.role == 'penciler (cover)',
              orElse: () => CreatorSummary('', 'unknown', ''),
            ),
          )
          .name,
      inkerCoverName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'inker (cover)',
            orElse: () => listOfCreators.firstWhere(
              (item) =>
                  item.role == 'colorist (cover)' ||
                  item.role == 'penciler (cover)',
              orElse: () => CreatorSummary('', 'unknown', ''),
            ),
          )
          .name,
      editorsName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'editor',
            orElse: () => CreatorSummary('', 'unknown', ''),
          )
          .name,
      pencilerCoverName: listOfCreators
          ?.firstWhere(
            (item) => item.role == 'penciler (cover)',
            orElse: () => listOfCreators.firstWhere(
              (item) =>
                  item.role == 'colorist (cover)' ||
                  item.role == 'inker (cover)',
              orElse: () => CreatorSummary('', 'unknown', ''),
            ),
          )
          .name,
    );
    data.creatorsOfSeriesComicName = SeriesOfComicCreatorsNamesData(
      creatorsNames: listOfCreators?.map((i) => i.name).join(', ') ?? '',
    );
    notifyListeners();
  }

  Future<void> loadComicDetails() async {
    try {
      _dateFormat = DateFormat.yMMMd();
      _comicDetailsWrapper = await _comicService.comicDetails(comicId);
      _comicDetails = _comicDetailsWrapper?.data.comic.firstWhere(
        (comic) => comic.id == comicId,
      );
      _updateDataOfComic(_comicDetails);
      _loadSeriesOfComic();
      notifyListeners();
    } catch (e) {
      print('smth bad happened');
    }
  }

  Future<void> _loadSeriesOfComic() async {
    try {
      final seriesResponse = await _comicService.seriesOfComic(
          _comicDetails?.series?.resourceURI ??
              'https://gateway.marvel.com/v1/public/series/34718');
      final comicOfSeries = _seriesOfComic.firstWhere(
        (comic) => comic.id == comicId,
      );
      _seriesOfComic.addAll(seriesResponse.data.comic);
      _updateDataOfComic(comicOfSeries);
      notifyListeners();
    } catch (e) {
      print('smth bad with series happened');
    }
  }
}
