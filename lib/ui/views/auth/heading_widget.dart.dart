
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final Widget button;

  const HeadingWidget({
    super.key,
    required this.text,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
          ),
          child: Text(text,
            style: TextStyle(
              fontSize: 4.5.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 3.h),
        button,
      ],
    );
  }
}
