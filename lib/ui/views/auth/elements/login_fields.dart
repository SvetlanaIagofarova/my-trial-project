import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/elements/buttons/common_buttons.dart.dart';
import 'package:my_trial_project/ui/tools/provider_template.dart';
import 'package:my_trial_project/ui/views/auth/login/login_view_model.dart';
import 'package:sizer/sizer.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    final modelRead = NotifierProvider.read<LoginAuthModel>(context);
    final modelWatch = NotifierProvider.watch<LoginAuthModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _ErrorMessageWidget(),
        TextField(
          controller: modelRead?.emailTextController,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Email',
            isDense: true,
            contentPadding: EdgeInsets.all(1.5.h),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextField(
          controller: modelRead?.passwordTextController,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'Password',
            isDense: true,
            contentPadding: EdgeInsets.all(1.5.h),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot password?',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 1.5.h),
        MyGradientButton(
          onPressed: modelWatch?.canStartAuth == true
              ? () => modelWatch?.auth(context)
              : null,
          child: const Text('Log in'),
        ),
      ],
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<LoginAuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Text(
      errorMessage,
      style: TextStyle(
        color: Colors.red,
        fontSize: 2.h,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
