import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';

enum ApiClientExceptionType { network, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _endPoint = 'http://gateway.marvel.com';
  static const _apiKeyPrivate = String.fromEnvironment('API_KEY_PRIVATE');
  static const _apiKeyPublic = String.fromEnvironment('API_KEY_PUBLIC');
  static final String _ts = DateTime.now().millisecondsSinceEpoch.toString();
  static final String _hashInput = '$_ts$_apiKeyPrivate$_apiKeyPublic';
  static String _hash() => md5.convert(utf8.encode(_hashInput)).toString();
  static const _portraitFantasticImageSize = '/portrait_fantastic.';
  static const _portraitSquareFantasticImageSize = '/standard_fantastic.';
  static const _portraitIncredibleImageSize = '/portrait_incredible.';

  static String imagePortraitFantasticUrl(String path, String imageExtension) =>
      path + _portraitFantasticImageSize + imageExtension;

  static String imagePortraitSquareUrl(String path, String imageExtension) =>
      path + _portraitSquareFantasticImageSize + imageExtension;

  static String imagePortraitLandscapeUrl(String path, String imageExtension) =>
      path + _portraitIncredibleImageSize + imageExtension;

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_endPoint$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Uri _makeUriFromApi(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse(path);
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<WrapperObject> latestComics(
    String dateDescriptor,
    int offset,
    bool noVariants,
    String orderBy,
  ) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WrapperObject.fromJson(jsonMap);
      return response;
    }

    final result = _get(
      '/v1/public/comics',
      parser,
      <String, dynamic>{
        'noVariants': noVariants.toString(),
        'dateDescriptor': dateDescriptor,
        'orderBy': orderBy,
        'offset': offset.toString(),
        'ts': _ts,
        'apikey': _apiKeyPublic,
        'hash': _hash(),
      },
    );
    return result;
  }

  Future<WrapperObject> comicDetails(
    int comicId,
  ) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WrapperObject.fromJson(jsonMap);
      return response;
    }

    final result = _get(
      '/v1/public/comics/$comicId',
      parser,
      <String, dynamic>{
        'ts': _ts,
        'apikey': _apiKeyPublic,
        'hash': _hash(),
      },
    );
    return result;
  }

  Future<WrapperObject> seriesOfComic(
    String seriesUrl,
  ) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = WrapperObject.fromJson(jsonMap);
      return response;
    }

    final result = _getUriFromApi(
      '$seriesUrl/comics',
      parser,
      <String, dynamic>{
        'ts': _ts,
        'apikey': _apiKeyPublic,
        'hash': _hash(),
      },
    );
    return result;
  }

  Future<T> _get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> _getUriFromApi<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUriFromApi(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final dynamic status = json['code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.network);
      } else {
        throw ApiClientException(ApiClientExceptionType.other);
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
