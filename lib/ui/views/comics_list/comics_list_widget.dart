import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/api_client/api_client.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_model.dart';
import 'package:sizer/sizer.dart';

class ComicsListWidget extends StatelessWidget {
  final ScrollController? controller;

  const ComicsListWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ComicsListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        GridView.builder(
          controller: controller,
          padding: EdgeInsets.only(top: 10.0.h),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.comics.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            crossAxisSpacing: 3.0.h,
            mainAxisSpacing: 3.0.h,
            mainAxisExtent: 51.1.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            final comics = model.comics[index];
            final imagePath = comics.thumbnail?.path;
            final imageExtension = comics.thumbnail?.imageExtension ?? '';
            final onsaleDate = comics.dates?.map((i) => i.date).first;
            return Stack(
              children: [
                Container(
                  child: Column(
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
                          child: imagePath != null
                              ? Image.network(
                                  ApiClient.imageUrl(imagePath, imageExtension),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 2.0.h,),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                comics.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.3.h,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                model.stringFromDate(onsaleDate),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 1.75.h,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                comics.creators?.items
                                        ?.map((i) => i.name)
                                        .join(', ') ??
                                    '',
                                style: TextStyle(
                                  fontSize: 1.65.h,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
