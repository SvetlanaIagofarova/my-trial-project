import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/api_client/image_getter.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ComicsListWidget extends StatefulWidget {
  final ScrollController? controller;

  const ComicsListWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  State<ComicsListWidget> createState() => _ComicsListWidgetState();
}

class _ComicsListWidgetState extends State<ComicsListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<ComicsListViewModel>().loadComics();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ComicsListViewModel>();

    return GridView.builder(
      controller: widget.controller,
      padding: EdgeInsets.only(top: 2.5.h),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: model.comic.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        crossAxisSpacing: 3.0.h,
        mainAxisSpacing: 3.0.h,
        mainAxisExtent: 51.1.h,
      ),
      itemBuilder: (BuildContext context, int index) {
        model.showComicsByIndex(index);
        return ComicsListDisplay(index: index);
      },
    );
  }
}

class ComicsListDisplay extends StatelessWidget {
  final int index;
  const ComicsListDisplay({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.read<ComicsListViewModel>();
    final comic = model.comic[index];

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2.0.h,
                      offset: Offset(0, 2.5.h),
                    ),
                  ],
                ),
                child: Image.network(
                  ImageGetter.imagePortraitFantasticUrl(
                      comic.imagePath, comic.imageExtension),
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.0.h,
                horizontal: 2.0.h,
              ),
              child: Column(
                children: [
                  Text(
                    comic.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 2.3.h,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    comic.onsaleDate,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 1.75.h,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    comic.creators,
                    style: TextStyle(
                      fontSize: 1.65.h,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            // borderRadius: BorderRadius.circular(10),
            onTap: () => model.onComicsTap(context, index),
          ),
        ),
      ],
    );
  }
}
