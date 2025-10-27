import 'package:news/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.title, required this.id, required this.image});

  static List<Category> getCategoriesList(bool isDark) {
    return [
      Category(
        title: 'General',
        id: 'general',
        image: isDark ? AppAsset.generalDarkImage : AppAsset.generalLightImage,
      ),
      Category(
        title: 'Business',
        id: 'business',
        image: isDark
            ? AppAsset.businessDarkImage
            : AppAsset.businessLightImage,
      ),
      Category(
        title: 'Sports',
        id: 'sports',
        image: isDark ? AppAsset.sportsDarkImage : AppAsset.sportsLightImage,
      ),
      Category(
        title: 'Technology',
        id: 'technology',
        image: isDark
            ? AppAsset.technologyDarkImage
            : AppAsset.technologyLightImage,
      ),
      Category(
        title: 'Entertainment',
        id: 'entertainment',
        image: isDark
            ? AppAsset.entertainmentDarkImage
            : AppAsset.entertainmentLightImage,
      ),
      Category(
        title: 'Health',
        id: 'health',
        image: isDark ? AppAsset.healthDarkImage : AppAsset.healthLightImage,
      ),
      Category(
        title: 'Science',
        id: 'science',
        image: isDark ? AppAsset.scienceDarkImage : AppAsset.scienceLightImage,
      ),
    ];
  }
}
