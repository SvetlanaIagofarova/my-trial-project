import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/entity/comics/comic_date.dart';
import 'package:my_trial_project/domain/entity/comics/creator_summary.dart';
import 'package:my_trial_project/ui/theme/app_colors.dart';
import 'package:my_trial_project/ui/tools/attribution_text.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:sizer/sizer.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mainDarkGrey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3.0.h, 3.0.h, 1.0.h, 1.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 7.0.h),
            Center(
              child: _TitleDetailsWidget('MORE DETAILS'),
            ),
            SizedBox(height: 10.0.h),
            const _ExtendedCreditsAndInfoWidget(),
            SizedBox(height: 10.0.h),
            const _StoriesWidget(),
            SizedBox(height: 10.0.h),
            const _CoverInformationWidget(),
            SizedBox(height: 12.25.h),
            const AttributionTextWidget(color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

Text _TitleDetailsWidget(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 5.0.h,
      fontWeight: FontWeight.w500,
    ),
  );
}

Text _SubtitleDetailsWidget(String subtitle) {
  return Text(
    subtitle,
    style: TextStyle(
      color: Colors.white,
      fontSize: 2.9.h,
      fontWeight: FontWeight.w500,
    ),
  );
}

class _DescriptionStringWidget extends StatelessWidget {
  final String detail;
  final String value;
  const _DescriptionStringWidget({
    required this.detail,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final detailStyle = TextStyle(
      color: Colors.grey,
      fontSize: 2.75.h,
      fontWeight: FontWeight.w600,
    );
    final valueStyle = TextStyle(
      color: Colors.grey,
      fontSize: 2.75.h,
    );
    return Row(
      children: [
        Text(
          detail,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: detailStyle,
        ),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: valueStyle,
        ),
      ],
    );
  }
}

class _DescriptionButtonWidget extends StatelessWidget {
  final String detail;
  final String value;
  const _DescriptionButtonWidget({
    required this.detail,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final detailStyle = TextStyle(
      color: Colors.grey,
      fontSize: 2.75.h,
      fontWeight: FontWeight.w600,
    );
    final valueStyle = TextStyle(
      color: Colors.grey,
      fontSize: 2.75.h,
      fontWeight: FontWeight.w400,
    );
    return Row(
      children: [
        Text(
          detail,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: detailStyle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: valueStyle,
          ),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}

class _ExtendedCreditsAndInfoWidget extends StatelessWidget {
  const _ExtendedCreditsAndInfoWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    final formatValue = model.comicDetails?.format;
    final priceValue =
        model.comicDetails?.prices?.map((p) => p.price).last.toString();
    final upcValue = model.comicDetails?.upc;
    final focDateValue = model.comicDetails?.dates
        ?.firstWhere((date) => date.type == 'focDate',
            orElse: () => ComicDate(
                  '',
                  DateTime.now(),
                ))
        .date;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SubtitleDetailsWidget('EXTENDED CREDITS AND INFO'),
        SizedBox(height: 3.0.h),
        const _DescriptionStringWidget(
          detail: 'Rating: ',
          value: 'Rated T',
        ),
        formatValue != ''
            ? _DescriptionStringWidget(
                detail: 'Format: ',
                value: formatValue ?? '',
              )
            : const SizedBox.shrink(),
        priceValue != ''
            ? _DescriptionStringWidget(
                detail: 'Price: \$',
                value: priceValue ?? '',
              )
            : const SizedBox.shrink(),
        upcValue != ''
            ? _DescriptionStringWidget(
                detail: 'UPC: ',
                value: upcValue ?? '',
              )
            : const SizedBox.shrink(),
        focDateValue != DateTime.now()
            ? _DescriptionStringWidget(
                detail: 'FOC Date: ',
                value: model.stringFromDate(focDateValue),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _StoriesWidget extends StatelessWidget {
  const _StoriesWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    final listOfCreators = model.comicDetails?.creators?.items;
    final writersName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'writer',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final inkersName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'inker',
          orElse: () => listOfCreators.firstWhere(
            (item) => item.role == 'inker (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          ),
        )
        .name;
    final coloristsName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'colorist' || item.role == 'colorist (cover)',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final letterersName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'letterer',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final pencilersName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'inker' || item.role == 'penciler (cover)',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final editorsName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'editor',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SubtitleDetailsWidget('STORIES'),
        SizedBox(height: 3.0.h),
        writersName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Writer: ',
                value: writersName ?? '',
              )
            : const SizedBox.shrink(),
        inkersName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Inker: ',
                value: inkersName ?? '',
              )
            : const SizedBox.shrink(),
        coloristsName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Colorist: ',
                value: coloristsName ?? '',
              )
            : const SizedBox.shrink(),
        letterersName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Letterer: ',
                value: letterersName ?? '',
              )
            : const SizedBox.shrink(),
        pencilersName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Penciler: ',
                value: pencilersName ?? '',
              )
            : const SizedBox.shrink(),
        editorsName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Editor: ',
                value: editorsName ?? '',
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _CoverInformationWidget extends StatelessWidget {
  const _CoverInformationWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    final listOfCreators = model.comicDetails?.creators?.items;
    final coloristCoverName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'colorist (cover)',
          orElse: () => listOfCreators.firstWhere(
            (item) =>
                item.role == 'inker (cover)' || item.role == 'penciler (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          ),
        )
        .name;
    final inkerCoverName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'inker (cover)',
          orElse: () => listOfCreators.firstWhere(
            (item) =>
                item.role == 'colorist (cover)' ||
                item.role == 'penciler (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          ),
        )
        .name;
    final editorsName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'editor',
          orElse: () => CreatorSummary('', 'unknown', ''),
        )
        .name;
    final pencilerCoverName = listOfCreators
        ?.firstWhere(
          (item) => item.role == 'penciler (cover)',
          orElse: () => listOfCreators.firstWhere(
            (item) =>
                item.role == 'colorist (cover)' || item.role == 'inker (cover)',
            orElse: () => CreatorSummary('', 'unknown', ''),
          ),
        )
        .name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SubtitleDetailsWidget('COVER INFORMATION'),
        SizedBox(height: 3.0.h),
        coloristCoverName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Colorist (cover): ',
                value: coloristCoverName ?? '',
              )
            : const SizedBox.shrink(),
        inkerCoverName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Inker (cover): ',
                value: inkerCoverName ?? '',
              )
            : const SizedBox.shrink(),
        editorsName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Editor: ',
                value: editorsName ?? '',
              )
            : const SizedBox.shrink(),
        pencilerCoverName != 'unknown'
            ? _DescriptionButtonWidget(
                detail: 'Penciler (cover): ',
                value: pencilerCoverName ?? '',
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
