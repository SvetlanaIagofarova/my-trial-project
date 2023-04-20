import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/views/comics_details/comic_details_more_details_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_info_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_series_of_comic_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_view_model.dart';
import 'package:provider/provider.dart';
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
    Future.microtask(
      () => context.read<ComicDetailsViewModel>().loadComicDetails(),
    );
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
    final title =
        context.select((ComicDetailsViewModel model) => model.data.title);
    return Text(title);
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((ComicDetailsViewModel model) => model.data.isLoading);
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
