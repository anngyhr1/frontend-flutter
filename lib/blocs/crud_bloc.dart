import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/resources/crud_story.dart';
import 'package:rxdart/rxdart.dart';

class CrudBloc {
  CrudBloc() {
    setTagList([]);
    setSelectedCat("");
    setFormStorie(FormStorie());
  }
  StoryCrudImpl storyCrudImpl = StoryCrudImpl();
  final _formStorie = BehaviorSubject<FormStorie>();
  final _tagList = BehaviorSubject<List<String>>();
  final _selectedCat = BehaviorSubject<String>();

  // Setter
  Function(FormStorie) get setFormStorie => _formStorie.sink.add;
  Function(List<String>) get setTagList => _tagList.sink.add;
  Function(String) get setSelectedCat => _selectedCat.sink.add;

  // Getter
  Stream<FormStorie> get getFormStorie => _formStorie.stream;
  FormStorie get currentFormStorie => _formStorie.value;
  Stream<List<String>> get getTagList => _tagList.stream;
  Stream<String> get getSelectedCag => _selectedCat.stream;

  Future<void> insertStory() async {
    FormStorie formStorie = _formStorie.value;
    String category = _selectedCat.value;
    List<String> tags = _tagList.value;

    StorieModel storie = StorieModel(formStorie.title, 
                              formStorie.body, 
                              "none",
                              "assets/image5.jpg", 
                              0, 
                              0, 
                              tags, 
                              category);
    await storyCrudImpl.insertStory(storie);
  }

  dispose() {
    _formStorie.close();
    _tagList.close();
    _selectedCat.close();
  }
}

class FormStorie {
  String? title;
  String? body;
  String? category;
  List<String>? tags;
}
