import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_info_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_screen_cast_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_model.dart';

class ComicsDetailsWidget extends StatelessWidget {
  const ComicsDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            const ComicsDetailsMainInfoWidget(),
            const SizedBox(height: 30),
            const ComicsDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicDetailsModel>(context);
    return Text( model?.comicDetails?.title ?? 'Loading...');
  }
}
