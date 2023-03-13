import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/domain/entity/comics/creator_summary.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:sizer/sizer.dart';

class ComicsDetailsMainInfoWidget extends StatelessWidget {
  const ComicsDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.5.h,
            horizontal: 3.0.h,
          ),
          child: const _ComicsNameWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6.0.h,
            horizontal: 3.0.h,
          ),
          child: const _AuthorsDescriptionPlaceholderWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.5.h,
            horizontal: 3.0.h,
          ),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.5.h,
            horizontal: 3.0.h,
          ),
          child: const _DescriptionWidget(),
        ),
        const SizedBox(height: 30),
        const _PeopleWidgets(),
      ],
    );
  }

  Text _OverviewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    final imagePath = model.comicDetails?.thumbnail?.path;
    final imageExtension = model.comicDetails?.thumbnail?.imageExtension ?? '';
    return imagePath != null
        ? AspectRatio(
            aspectRatio: 0.95,
            child: Image.network(
              ApiClient.imagePortraitLandscapeUrl(imagePath, imageExtension),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ComicsNameWidget extends StatelessWidget {
  const _ComicsNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    return Text(
      model?.comicDetails?.title ?? '',
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 3.8.h,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _AuthorsDescriptionPlaceholderWidget extends StatelessWidget {
  const _AuthorsDescriptionPlaceholderWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    final onsaleDate = model.comicDetails?.dates?.map((i) => i.date).first;
    final listOfCreators = model.comicDetails?.creators?.items;
    final writersNames = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'writer' || item.role == 'writer (cover)',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final pencilersNames = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'inker' || item.role == 'penciler (cover)',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final coverArtistsNames = listOfCreators
        ?.firstWhere(
          (item) =>
              item.role == 'penciler (cover)' || item.role == 'inker (cover)',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        _AuthorsDescriptionWidget(
          description: 'Published:',
          name: model.stringFromDate(onsaleDate),
        ),
        SizedBox(height: 2.5.h),
        writersNames != 'unknown'
            ? _AuthorsDescriptionWidget(
                description: 'Writer:',
                name: writersNames ?? '',
              )
            : const SizedBox.shrink(),
        SizedBox(height: 2.5.h),
        pencilersNames != 'unknown'
            ? _AuthorsDescriptionWidget(
                description: 'Penciler:',
                name: pencilersNames ?? '',
              )
            : const SizedBox.shrink(),
        SizedBox(height: 2.5.h),
        coverArtistsNames != 'unknown'
            ? _AuthorsDescriptionWidget(
                description: 'Cover Artist:',
                name: coverArtistsNames ?? '',
              )
            : const SizedBox.shrink(),
        SizedBox(height: 2.0.h),
      ],
    );
  }
}

class _AuthorsDescriptionWidget extends StatelessWidget {
  final String description;
  final String name;
  const _AuthorsDescriptionWidget({
    required this.description,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = TextStyle(
      color: Colors.white,
      fontSize: 3.0.h,
      fontWeight: FontWeight.w600,
    );
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 3.0.h,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: descriptionStyle,
        ),
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: nameStyle,
        ),
      ],
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    const jobTilteStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stefano Sollima', style: nameStyle),
                const Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stefano Sollima', style: nameStyle),
                const Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stefano Sollima', style: nameStyle),
                const Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stefano Sollima', style: nameStyle),
                const Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}
