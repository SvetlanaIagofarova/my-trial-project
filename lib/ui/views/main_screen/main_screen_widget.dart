import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_trial_project/ui/tools/elements/buttons/profile_button.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_model.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_widget.dart';
import 'package:my_trial_project/ui/views/news/news_widget.dart';
import 'package:my_trial_project/ui/views/tv_show_list/tv_show_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  Widget _title = const Text('MARVEL');
  final comicsListModel = ComicsListModel();
  late ScrollController bottomHideController;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
      switch (index) {
        case 0:
          _title = const Text('News');
          break;
        case 1:
          _title = const Text('Comics');
          break;
        case 2:
          _title = const Text('Series');
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    comicsListModel.loadComics();
    bottomHideController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    comicsListModel.loadComics();
  }

  @override
  void dispose() {
    bottomHideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: [
          const ProfileButton(),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const NewsWidget(),
          NotifierProvider(
            model: comicsListModel,
            child: ComicsListWidget(
              controller: bottomHideController,
            ),
          ),
          const TVShowListWidget(),
        ],
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: bottomHideController,
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'News',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter),
              label: 'Comics',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Series',
            ),
          ],
          onTap: onSelectTab,
        ),
      ),
    );
  }
}

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget({
    super.key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      showBottomBar();
    } else if (direction == ScrollDirection.reverse) {
      hideBottomBar();
    }
  }

  void showBottomBar() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hideBottomBar() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: widget.duration,
        height: isVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [widget.child],
        ),
      );
}
