import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_info_widget.dart';
import 'package:my_trial_project/ui/views/comics_details/comics_details_main_screen_cast_widget.dart';

class ComicsDetailsWidget extends StatefulWidget {
  final int comics;

  const ComicsDetailsWidget({
    Key? key,
    required this.comics,
  }) : super(key: key);

  @override
  _ComicsDetailsWidgetState createState() => _ComicsDetailsWidgetState();
}

class _ComicsDetailsWidgetState extends State<ComicsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tom Clancy`s Without Remorse'),
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
