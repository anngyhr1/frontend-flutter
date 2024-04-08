import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _sugestions = BehaviorSubject<List<StorieModel>>();
  final _repository = Repository();

  Stream<List<StorieModel>> get getSugestions => _sugestions.stream;
  Function(List<StorieModel>) get setSugestions => _sugestions.sink.add;

  loadSugestions(String q) async {
    List<StorieModel> sugestionList =
        await _repository.fetchStoriesLazy(q, 0, "stories", false, "");
    print(sugestionList);
    await setSugestions(sugestionList);
  }

  dispose() {
    _sugestions.close();
  }
}
