import 'package:flutter/material.dart';
import 'package:my_trial_project/tools/elements/common_buttons.dart.dart';
import 'package:my_trial_project/ui/navigation/main_navigation.dart';
import 'package:my_trial_project/ui/views/auth/elements/login_fields.dart';
import 'package:my_trial_project/ui/views/auth/heading_widget.dart.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login to your account'),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 5.h, right: 5.h, top: 3.h, bottom: 1.h),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                HeadingWidget(
                  text: 'Welcome back to your own space in the Cambridge dictionary',
                  button: MyGradientButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(MainNavigationRouteNames.registerView);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Don't have an account? "),
                        Text(
                          " Sign up!",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.5.h),
                const LoginFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
