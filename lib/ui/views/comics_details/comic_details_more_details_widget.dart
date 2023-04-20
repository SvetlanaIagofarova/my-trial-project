import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/theme/app_colors.dart';
import 'package:my_trial_project/ui/tools/attribution_text.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_view_model.dart';
import 'package:provider/provider.dart';
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
              child: _titleDetailsWidget('MORE DETAILS'),
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

Text _titleDetailsWidget(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 5.0.h,
      fontWeight: FontWeight.w500,
    ),
  );
}

Text _subtitleDetailsWidget(String subtitle) {
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
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: valueStyle,
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
    final extendedCreditsAndInfo = context.select(
        (ComicDetailsViewModel model) => model.data.extendedCreditsAndInfo);
    final formatValue = extendedCreditsAndInfo.formatValue;
    final priceValue = extendedCreditsAndInfo.priceValue;
    final upcValue = extendedCreditsAndInfo.upcValue;
    final focDateValue = extendedCreditsAndInfo.focDateValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subtitleDetailsWidget('EXTENDED CREDITS AND INFO'),
        SizedBox(height: 3.0.h),
        const _DescriptionStringWidget(
          detail: 'Rating: ',
          value: 'Rated T',
        ),
        if (formatValue != '')
          _DescriptionStringWidget(
            detail: 'Format: ',
            value: formatValue ?? '',
          ),
        if (priceValue != '')
          _DescriptionStringWidget(
            detail: 'Price: \$',
            value: priceValue ?? '',
          ),
        if (upcValue != '')
          _DescriptionStringWidget(
            detail: 'UPC: ',
            value: upcValue ?? '',
          ),
        if (focDateValue != null)
          _DescriptionStringWidget(
            detail: 'FOC Date: ',
            value: focDateValue,
          ),
      ],
    );
  }
}

class _StoriesWidget extends StatelessWidget {
  const _StoriesWidget();

  @override
  Widget build(BuildContext context) {
    final storiesData =
        context.select((ComicDetailsViewModel model) => model.data.storiesData);
    final writersName = storiesData.writersName;
    final inkersName = storiesData.inkersName;
    final coloristsName = storiesData.coloristsName;
    final letterersName = storiesData.letterersName;
    final pencilersName = storiesData.pencilersName;
    final editorsName = storiesData.editorsName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subtitleDetailsWidget('STORIES'),
        SizedBox(height: 3.0.h),
        if (writersName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Writer: ',
            value: writersName ?? '',
          ),
        if (inkersName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Inker: ',
            value: inkersName ?? '',
          ),
        if (coloristsName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Colorist: ',
            value: coloristsName ?? '',
          ),
        if (letterersName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Letterer: ',
            value: letterersName ?? '',
          ),
        if (pencilersName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Penciler: ',
            value: pencilersName ?? '',
          ),
        if (editorsName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Editor: ',
            value: editorsName ?? '',
          ),
      ],
    );
  }
}

class _CoverInformationWidget extends StatelessWidget {
  const _CoverInformationWidget();

  @override
  Widget build(BuildContext context) {
    final coverInformation = context
        .select((ComicDetailsViewModel model) => model.data.coverInformation);
    final coloristCoverName = coverInformation.coloristCoverName;
    final inkerCoverName = coverInformation.inkerCoverName;
    final editorsName = coverInformation.editorsName;
    final pencilerCoverName = coverInformation.pencilerCoverName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subtitleDetailsWidget('COVER INFORMATION'),
        SizedBox(height: 3.0.h),
        if (coloristCoverName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Colorist (cover): ',
            value: coloristCoverName ?? '',
          ),
        if (inkerCoverName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Inker (cover): ',
            value: inkerCoverName ?? '',
          ),
        if (editorsName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Editor: ',
            value: editorsName ?? '',
          ),
        if (pencilerCoverName != 'unknown')
          _DescriptionButtonWidget(
            detail: 'Penciler (cover): ',
            value: pencilerCoverName ?? '',
          ),
      ],
    );
  }
}
