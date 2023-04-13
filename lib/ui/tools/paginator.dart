class PaginatorResult<T> {
  final List<T> data;
  final int currentOffset;
  final int totalNumber;

  PaginatorResult({
    required this.data,
    required this.currentOffset,
    required this.totalNumber,
  });
}

typedef PaginatorLoadResult<T> = Future<PaginatorResult<T>> Function(int);

class Paginator<T> {
  final _data = <T>[];
  List<T> get data => _data;

  int _currentOffset = 0;
  int _totalNumber = 1;
  var _isLoadingInProgress = false;
  final PaginatorLoadResult<T> load;

  Paginator(this.load);

  Future<void> loadComics() async {
    if (_isLoadingInProgress || _currentOffset >= _totalNumber) return;
    _isLoadingInProgress = true;
    final nextOffset = _currentOffset + 20;

    try {
      final result = await load(nextOffset);
      _data.addAll(result.data);
      _currentOffset = result.currentOffset;
      _totalNumber = result.totalNumber;
      _isLoadingInProgress = false;
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }
}
