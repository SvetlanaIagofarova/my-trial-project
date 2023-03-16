import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comic_details_more_details_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_info_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_series_of_comic_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';
import 'package:sizer/sizer.dart';

class ComicsDetailsWidget extends StatefulWidget {
  const ComicsDetailsWidget({Key? key}) : super(key: key);

  @override
  State<ComicsDetailsWidget> createState() => _ComicsDetailsWidgetState();
}

class _ComicsDetailsWidgetState extends State<ComicsDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<ComicDetailsModel>(context)?.loadComicDetails();
    NotifierProvider.read<ComicDetailsModel>(context)?.loadSeriesOfComic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: _BodyWidget(),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    return Text(model?.comicDetails?.title ?? 'Loading...');
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    final comicDetails = model?.comicDetails;
    if (comicDetails == null)
      return const Center(
        child: CircularProgressIndicator(),
      );
    return ListView(
      children: [
        const ComicsDetailsMainInfoWidget(),
        SizedBox(height: 5.0.h),
        const MoreDetailsWidget(),
        const ComicsDetailsSeriesOfComicWidget(),
      ],
    );
  }
}
