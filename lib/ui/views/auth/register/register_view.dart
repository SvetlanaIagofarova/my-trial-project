import 'package:flutter/material.dart';
import 'package:my_trial_project/tools/elements/common_buttons.dart.dart';
import 'package:my_trial_project/ui/navigation/main_navigation.dart';
import 'package:my_trial_project/ui/views/auth/heading_widget.dart.dart';
import 'package:my_trial_project/ui/views/auth/register/elements/register_fields.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('Account registration'),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 5.h, right: 5.h, top: 3.h, bottom: 1.h),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                HeadingWidget(
                  text:
                      'Create your own space in the Cambridge dictionary',
                  button: MyGradientButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(MainNavigationRouteNames.loginView);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Already have an account? "),
                        Text(
                          " Sign in!",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.5.h),
                const RegisterFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
