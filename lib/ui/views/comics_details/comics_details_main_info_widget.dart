import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/api_client/image_getter.dart';
import 'package:my_trial_project/domain/entity/comics/creator_summary.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ComicsDetailsMainInfoWidget extends StatelessWidget {
  const ComicsDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 1.5.h),
        const _TopPosterWidget(),
        SizedBox(height: 1.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.5.h,
            horizontal: 3.0.h,
          ),
          child: const _ComicsNameWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(3.0.h),
          child: const _AuthorsAndDateDescriptionPlaceholderWidget(),
        ),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageFullPath =
        context.select((ComicDetailsViewModel model) => model.data.imageData);
    final imagePath = imageFullPath.imagePath;
    final imageExtension = imageFullPath.imageExtension;
    return (imagePath != null && imageExtension != null)
        ? AspectRatio(
            aspectRatio: 0.95,
            child: Image.network(
              ImageGetter.imagePortraitLandscapeUrl(imagePath, imageExtension),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ComicsNameWidget extends StatelessWidget {
  const _ComicsNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title =
        context.select((ComicDetailsViewModel model) => model.data.title);
    return Text(
      title,
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

class _AuthorsAndDateDescriptionPlaceholderWidget extends StatelessWidget {
  const _AuthorsAndDateDescriptionPlaceholderWidget();

  @override
  Widget build(BuildContext context) {
    final authorsAndDate = context
        .select((ComicDetailsViewModel model) => model.data.authorsAndDate);

    final onsaleDate = authorsAndDate.onsaleDate ?? '';
    final writersNames = authorsAndDate.onsaleDate ?? '';
    final pencilersNames = authorsAndDate.pencilersNames ?? '';
    final coverArtistsNames = authorsAndDate.coverArtistsNames ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AuthorsDescriptionWidget(
          role: 'Published:',
          name: onsaleDate,
        ),
        SizedBox(height: 2.5.h),
        if (writersNames != 'unknown')
          _AuthorsDescriptionWidget(
            role: 'Writer:',
            name: writersNames,
          ),
        SizedBox(height: 2.5.h),
        if (pencilersNames != 'unknown')
          _AuthorsDescriptionWidget(
            role: 'Penciler:',
            name: pencilersNames,
          ),
        SizedBox(height: 2.5.h),
        if (coverArtistsNames != 'unknown')
          _AuthorsDescriptionWidget(
            role: 'Cover Artist:',
            name: coverArtistsNames,
          ),
        SizedBox(height: 2.0.h),
      ],
    );
  }
}

class _AuthorsDescriptionWidget extends StatelessWidget {
  final String role;
  final String name;
  const _AuthorsDescriptionWidget({
    required this.role,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final roleStyle = TextStyle(
      color: Colors.white,
      fontSize: 3.25.h,
      fontWeight: FontWeight.w600,
    );
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 3.25.h,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: roleStyle,
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
