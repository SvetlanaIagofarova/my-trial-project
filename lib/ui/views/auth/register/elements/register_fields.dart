import 'package:flutter/material.dart';
import 'package:my_trial_project/ui/tools/elements/buttons/common_buttons.dart.dart';
import 'package:my_trial_project/ui/navigation/main_navigation.dart';
import 'package:sizer/sizer.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;
  String? errorText;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _registration() {
    final name = _name.text;
    final email = _email.text;
    final password = _password.text;
    final confirmPassword = _confirmPassword.text;

    if (password != confirmPassword || name.isEmpty || email.isEmpty) {
      errorText = 'Wrong credentials';
    } else {
      errorText = null;
      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.mainScreen,
        (route) => false,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(
              color: Colors.red,
              fontSize: 2.h,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
        TextField(
          controller: _name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Name',
            isDense: true,
            contentPadding: EdgeInsets.all(1.5.h),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextField(
          controller: _email,
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
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextField(
          controller: _password,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Password',
            isDense: true,
            contentPadding: EdgeInsets.all(1.5.h),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        TextField(
          controller: _confirmPassword,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'Confirm password',
            isDense: true,
            contentPadding: EdgeInsets.all(1.5.h),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.4.h),
        MyGradientButton(
          onPressed: _registration,
          child: const Text('Sign up'),
        ),
      ],
    );
  }
}
