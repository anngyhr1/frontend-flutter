import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/resources/repository.dart';

class StoryCrudImpl implements StoryCrud {
  @override
  Future<void> deleteStory(StorieModel storie) {
    // TODO: implement deleteStory
    throw UnimplementedError();
  }

  @override
  Future<void> insertStory(StorieModel storie) async {
    print("insertStory");

    var uri = Uri.parse('http://localhost:5000/addStorie');
    var body = jsonEncode(<String, StorieModel>{
      'storie': storie,
    });

    var headers = { 'Content-type': 'application/json'};

    print("insertStory body -> $body");
    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      final parsedJson = json.decode(response.body);
      print("parsedJson " + parsedJson.toString());
    } catch (e) {
      print(e.toString());
    }

//
    //if (parsedJson["data"] != null)
    //  parsedJson["data"]
    //      .forEach((item) => categoryList.add(Category.fromJson(item)));
//
    //// parsedJson["data"].map((x) => StorieModel.fromJson(x));
    //return categoryList.length > 0 ? categoryList : [];
  }

  @override
  Future<void> updateStory(StorieModel storie) {
    // TODO: implement updateStory
    throw UnimplementedError();
  }


  Future<void> giveLike(String titulo, String operation) async {
    print("IN giveLike:::::::::::::::::::::::::::::::::::::");
    var uri = Uri.parse('http://localhost:5000/giveLike');
    var body = jsonEncode(<String, String>{
      'title': titulo,
      'operation': operation
    });

    var headers = { 'Content-type': 'application/json'};

    print("giveLike body -> $body");
    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      final parsedJson = json.decode(response.body);
      print("parsedJson " + parsedJson.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
