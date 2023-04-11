import 'dart:convert';

import 'package:crypto/crypto.dart';

class Configurations {
  static const endPoint = 'http://gateway.marvel.com';

  static const apiKeyPrivate = String.fromEnvironment('API_KEY_PRIVATE');
  static const apiKeyPublic = String.fromEnvironment('API_KEY_PUBLIC');
  static final String ts = DateTime.now().millisecondsSinceEpoch.toString();
  
  static final String hashInput = '$ts$apiKeyPrivate$apiKeyPublic';
  static String hash() => md5.convert(utf8.encode(hashInput)).toString();

  static const portraitFantasticImageSize = '/portrait_fantastic.';
  static const portraitSquareFantasticImageSize = '/standard_fantastic.';
  static const portraitIncredibleImageSize = '/portrait_incredible.';
}
