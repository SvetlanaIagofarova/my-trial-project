import 'package:my_trial_project/configurations/configurations.dart';
import 'package:my_trial_project/domain/api_client/comic_api_client.dart';
import 'package:my_trial_project/domain/entity/wrapper_object.dart';

class ComicService {
  final _apiClient = ComicApiClient();

  Future<WrapperObject> latestComics(
    String dateDescriptor,
    int offset,
    bool noVariants,
    String orderBy,
  ) async =>
      _apiClient.latestComics(
        dateDescriptor,
        offset,
        noVariants,
        orderBy,
        Configurations.ts,
        Configurations.apiKeyPublic,
        Configurations.hash(),
      );

  Future<WrapperObject> comicDetails(
    int comicId,
  ) async =>
      _apiClient.comicDetails(
        comicId,
        Configurations.ts,
        Configurations.apiKeyPublic,
        Configurations.hash(),
      );

  Future<WrapperObject> seriesOfComic(
    String seriesUrl,
  ) async =>
      _apiClient.seriesOfComic(
        seriesUrl,
        Configurations.ts,
        Configurations.apiKeyPublic,
        Configurations.hash(),
      );
}
