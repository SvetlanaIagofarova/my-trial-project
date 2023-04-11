import 'package:my_trial_project/configurations/configurations.dart';

class ImageGetter {
  static String imagePortraitFantasticUrl(String path, String imageExtension) =>
      path + Configurations.portraitFantasticImageSize + imageExtension;

  static String imagePortraitSquareUrl(String path, String imageExtension) =>
      path + Configurations.portraitSquareFantasticImageSize + imageExtension;

  static String imagePortraitLandscapeUrl(String path, String imageExtension) =>
      path + Configurations.portraitIncredibleImageSize + imageExtension;
}
