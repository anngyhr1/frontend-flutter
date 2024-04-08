import 'package:ebooks/models/category.dart';
import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc {
  final _repository = Repository();
  final scrollController = ScrollController();
  final _categories = PublishSubject<List<Category>>();
  final _storiesOutput = BehaviorSubject<List<StorieModel>>();
  final _stories = PublishSubject<List<StorieModel>>();
  final _pageNumber = BehaviorSubject<int>();
  final _categorySelected = BehaviorSubject<String?>();
  final _hasMore = BehaviorSubject<bool>();

  CategoriesBloc() {
    // enlaza _itemsFetcher con _itemsTransformer, de modo que cada vez que se
    // inserta um tem al stream, este pasa por este proceso de transformacion
    // y la salida de este sream es la entrada al stream _itemsOutput
    //_itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
    stories.transform(_storiesTransformer()).pipe(_storiesOutput);
    //stories.transform(_storiesTransformer()).toList();
    print('StoriesBloc setHasMore(true)');
    setHasMore(true);
    setPageNumber(0);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        loadMore();
      }
    });
  }

  Stream<List<StorieModel>> get stories => _stories.stream;
  Stream<List<Category>> get categories => _categories.stream;
  Stream<List<StorieModel>> get storieList => _storiesOutput.stream;
  Stream<String?> get categorySelected => _categorySelected.stream;

  Function(int) get setPageNumber => _pageNumber.sink.add;
  Function(List<Category>) get setCategories => _categories.sink.add;
  Function(String?) get setCategorySelected => _categorySelected.sink.add;
  Function(List<StorieModel>) get setStorieList => _storiesOutput.sink.add;
  Function(bool) get setHasMore => _hasMore.sink.add;

  _storiesTransformer() {
    return ScanStreamTransformer(
      (List<StorieModel> cache, List<StorieModel> stories, index) {
        if (_pageNumber.value == 0) cache.clear();
        // print("id, index" + id.toString() + " " + index.toString());
        cache.addAll(stories);
        // print("cache :: " + cache.toString());
        return cache;
      },
      <StorieModel>[],
    );
  }

  loadCategories() async {
    List<Category> categorieList =
        await _repository.fetchCategories("categories");
    setCategories(categorieList.toList());
  }

  loadMore() async {
    bool hasmore = _hasMore.value;
    print('IN loadMore, hasmore ' + hasmore.toString());
    // consulto las Ids de las historias
    if (hasmore) {
      if (_pageNumber.value == 0) {
        _stories.sink.add([]);
      }
      print("Stories Bloc, _categorySelected :: " + _categorySelected.value!);
      List<StorieModel> storieList = await _repository.fetchStoriesLazy(
          "", _pageNumber.value, "stories", false, _categorySelected.value);

      if (storieList.isEmpty) {
        setHasMore(false);
        print('loadMore setHasMore(false) ' + _hasMore.value.toString());
      } else {
        setPageNumber(_pageNumber.value + 1);
        // inserto los ids retornados en el stream
        _stories.sink.add(storieList.toList());
      }
    }
  }

  dispose() {
    _categories.close();
    _stories.close();
    _pageNumber.close();
    _storiesOutput.close();
    _hasMore.close();
    _categorySelected.close();
  }
}
