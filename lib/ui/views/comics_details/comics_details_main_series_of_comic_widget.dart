import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:sizer/sizer.dart';

class ComicsDetailsSeriesOfComicWidget extends StatelessWidget {
  const ComicsDetailsSeriesOfComicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(3.0.h),
            child: const Text(
              'RECOMMENDED SERIES',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 300,
            child: Scrollbar(
              child: _SeriesOfComicWidget(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0.h),
            child: TextButton(
              onPressed: () {},
              child: const Text('Full Cast & Crew'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeriesOfComicWidget extends StatelessWidget {
  const _SeriesOfComicWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);

    if (model == null) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: model.seriesOfComics.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _SeriesOfComicListWidget(comicIndex: index);
      },
    );
  }
}

class _SeriesOfComicListWidget extends StatelessWidget {
  final int comicIndex;
  const _SeriesOfComicListWidget({required this.comicIndex});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<ComicDetailsModel>(context);
    // model!.showSeriesOfComicByIndex(comicIndex);
    final comicOfSeries = model!.seriesOfComics[comicIndex];
    final imagePath = comicOfSeries.thumbnail?.path;
    final imageExtension = comicOfSeries.thumbnail?.imageExtension ?? '';
    return Padding(
      padding: EdgeInsets.all(2.0.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              imagePath != null
                  ? Image.network(
                      ApiClient.imagePortraitFantasticUrl(
                          imagePath, imageExtension),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comicOfSeries.title,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 2.0.h,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      comicOfSeries.creators?.items
                              ?.map((i) => i.name)
                              .join(', ') ??
                          '',
                      style: TextStyle(
                        fontSize: 1.5.h,
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 7),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
