import 'dart:async';
import 'package:ebooks/models/category.dart';

import 'news_api_provider.dart';
import '../models/storie_model.dart';

class Repository {
  List<Source> sources = <Source>[
    NewsApiProvider(),
  ];

  Future<List<StorieModel>> fetchStoriesLazy(String query, int page,
      String index, bool filterRecent, String? category) {
    return sources[0]
        .fetchStoriesLazy(query, page, index, filterRecent, category);
  }

  fetchCategories(String index) {
    return sources[0].fetchCategories("", 0, index, false);
  }
}

abstract class Source {
  Future<List<StorieModel>> fetchStoriesLazy(String query, int page,
      String index, bool filterRecent, String? category);

  Future<List<Category>> fetchCategories(
      String query, int page, String index, bool filterRecen);
}

abstract class StoryCrud {
  Future<void> insertStory(StorieModel storie);
  Future<void> updateStory(StorieModel storie);
  Future<void> deleteStory(StorieModel storie);
}
