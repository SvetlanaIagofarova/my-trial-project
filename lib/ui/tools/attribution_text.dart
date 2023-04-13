import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_view_model.dart';
import 'package:sizer/sizer.dart';

class AttributionTextWidget extends StatelessWidget {
  final Color color;
  const AttributionTextWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsViewModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Text(
      model.comicDetailsWrapper?.attributionText ?? '',
      style: TextStyle(
        color: color,
        fontSize: 1.5.h,
      ),
    );
  }
}
