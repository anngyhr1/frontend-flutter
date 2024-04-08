import 'dart:convert';
import 'package:ebooks/models/category.dart';
import 'package:http/http.dart' as http;
import '../models/storie_model.dart';
import 'dart:async';
import 'repository.dart';

class NewsApiProvider implements Source {
  Future<List<StorieModel>> fetchStoriesLazy(String query, int page,
      String index, bool filterRecent, String? category) async {
    List<StorieModel> storiesList = [];
    print("NewsApiProvider, current page : " + page.toString());
    final Map<String, String?> params = {
      'q': query,
      'page': page.toString(),
      'index': index,
      'filterRecent': filterRecent.toString(),
      'category': category
    };

    var uri = Uri.parse('http://localhost:5000/search');
    uri = uri.replace(queryParameters: params);
    print(uri);

    final response = await http.get(uri);
    final parsedJson = json.decode(response.body);
    print("parsedJson " + parsedJson.toString());

    if (parsedJson["data"] != null)
      parsedJson["data"]
          .forEach((x) => storiesList.add(StorieModel.fromJson(x)));

    // parsedJson["data"].map((x) => StorieModel.fromJson(x));
    return storiesList;
  }

  Future<List<Category>> fetchCategories(
      String query, int page, String index, bool filterRecent) async {
    List<Category> categoryList = [];
    print("NewsApiProvider, current page : " + page.toString());
    final Map<String, String> params = {
      'q': query,
      'page': page.toString(),
      'index': index,
      'filterRecent': filterRecent.toString()
    };

    var uri = Uri.parse('http://localhost:5000/search');
    uri = uri.replace(queryParameters: params);
    print(uri);

    final response = await http.get(uri);
    final parsedJson = json.decode(response.body);
    print("parsedJson " + parsedJson.toString());

    if (parsedJson["data"] != null)
      parsedJson["data"]
          .forEach((item) => categoryList.add(Category.fromJson(item)));

    // parsedJson["data"].map((x) => StorieModel.fromJson(x));
    return categoryList.length > 0 ? categoryList : [];
  }
}
