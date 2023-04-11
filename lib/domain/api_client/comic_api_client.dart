import 'package:my_trial_project/domain/api_client/network_api_client.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';
import 'package:my_trial_project/configurations/configurations.dart';

class ComicApiClient {
  final _networkApi = NetworkApiClient();

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

    final result = _networkApi.get(
      '/v1/public/comics',
      parser,
      <String, dynamic>{
        'noVariants': noVariants.toString(),
        'dateDescriptor': dateDescriptor,
        'orderBy': orderBy,
        'offset': offset.toString(),
        'ts': Configurations.ts,
        'apikey': Configurations.apiKeyPublic,
        'hash': Configurations.hash(),
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

    final result = _networkApi.get(
      '/v1/public/comics/$comicId',
      parser,
      <String, dynamic>{
        'ts': Configurations.ts,
        'apikey': Configurations.apiKeyPublic,
        'hash': Configurations.hash(),
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

    final result = _networkApi.getUriFromApi(
      '$seriesUrl/comics',
      parser,
      <String, dynamic>{
        'ts': Configurations.ts,
        'apikey': Configurations.apiKeyPublic,
        'hash': Configurations.hash(),
      },
    );
    return result;
  }
}
