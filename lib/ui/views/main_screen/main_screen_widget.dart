import 'package:flutter/material.dart';
import 'package:my_trial_project/domain/factories/screen_factory.dart';
import 'package:my_trial_project/ui/tools/scroll_to_hide_widget.dart';
import 'package:my_trial_project/ui/theme/profile_button.dart';
import 'package:my_trial_project/ui/views/comics_list/comics_list_view_model.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  
  int _selectedTab = 0;
  Widget _title = const Text('MARVEL');
  final _screenFactory = ScreenFactory();
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
    bottomHideController = ScrollController();
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
        actions: const [
          ProfileButton(),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makeNewsWidget(),
          _screenFactory.makeComicListWidget(),
          _screenFactory.makeTVShowWidget(),
        ],
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: bottomHideController,
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter),
              label: 'Comics',
            ),
            BottomNavigationBarItem(
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
