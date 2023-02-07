import 'package:flutter/material.dart';

class LoginAuthModel extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> auth(BuildContext context) async{}

  final bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
}