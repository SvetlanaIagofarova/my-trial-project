import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trial_project/domain/entity/comic.dart';
import 'package:my_trial_project/domain/services/comic_service.dart';
import 'package:my_trial_project/ui/navigation/main_navigation.dart';
import 'package:my_trial_project/ui/tools/paginator.dart';

class ComicsListDisplayData {
  final int id;
  final String title;
  final String imagePath;
  final String imageExtension;
  final String onsaleDate;
  final String creators;

  ComicsListDisplayData({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.imageExtension,
    required this.onsaleDate,
    required this.creators,
  });
}

class ComicsListViewModel extends ChangeNotifier {
  final _comicService = ComicService();
  late final Paginator<Comic> _latestComicPaginator;

  final String _dateDescriptor = 'thisMonth';
  final bool _noVariants = true;
  final String _orderBy = '-onsaleDate';

  var _comic = <ComicsListDisplayData>[];
  List<ComicsListDisplayData> get comic => List.unmodifiable(_comic);

  final _dateFormat = DateFormat.yMMMd();

  ComicsListViewModel() {
    _latestComicPaginator = Paginator<Comic>((offset) async {
      final result = await _comicService.latestComics(
        _dateDescriptor,
        offset,
        _noVariants,
        _orderBy,
      );
      return PaginatorResult(
        data: result.data.comic,
        currentOffset: result.data.offset,
        totalNumber: result.data.total,
      );
    });
  }

  Future<void> loadComics() async {
    await _latestComicPaginator.loadComics();
    _comic = _latestComicPaginator.data.map(_makeComicsData).toList();
    notifyListeners();
  }

  ComicsListDisplayData _makeComicsData(Comic comic) {
    final onSaleDate = comic.dates?.map((i) => i.date).first;
    final onSaleDateString =
        onSaleDate != null ? _dateFormat.format(onSaleDate) : '';

    final creatorsNames = comic.creators?.items?.map((i) => i.name);
    final listOfCreators =
        creatorsNames != null ? creatorsNames.join(', ') : '';
    return ComicsListDisplayData(
      id: comic.id,
      title: comic.title,
      imagePath: comic.thumbnail?.path ?? '',
      imageExtension: comic.thumbnail?.imageExtension ?? '',
      onsaleDate: onSaleDateString,
      creators: listOfCreators,
    );
  }

  void onComicsTap(BuildContext context, int index) {
    final id = _comic[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.comicsDetailsView,
      arguments: id,
    );
  }

  void showComicsByIndex(int index) {
    if (index < _comic.length - 3) return;
    loadComics();
  }
}
