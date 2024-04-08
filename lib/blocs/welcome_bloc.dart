import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class WelcomeBloc {
  final _repository = Repository();
  final _mLikedStorieTapped = BehaviorSubject<StorieModel>();
  final _mViewedStorieTapped = BehaviorSubject<StorieModel>();
  final _mostLikedStories = PublishSubject<List<StorieModel>>();
  final _mostViewedStories = PublishSubject<List<StorieModel>>();
  final _mostViewedCurrPage = BehaviorSubject<int>();
  final _recentPopularStories = PublishSubject<List<StorieModel>>();
  final _recentPopularCurrPage = BehaviorSubject<int>();

// Getters to Streams
  Stream<StorieModel>? get mLikedStorieTapped => _mLikedStorieTapped.stream;
  Stream<StorieModel> get mViewedStorieTapped =>
      _mViewedStorieTapped.stream; //.startWith(storieInit);
  Stream<List<StorieModel>> get mostLikedStories => _mostLikedStories.stream;
  Stream<List<StorieModel>> get mostViewedStories => _mostViewedStories.stream;
  Stream<int> get mostViewedCurrPage => _mostViewedCurrPage.stream;
  Stream<List<StorieModel>> get recentPopularStories =>
      _recentPopularStories.stream;
  Stream<int> get recentPopularCurrPage => _recentPopularCurrPage.stream;

// Getters to Sinks
  Function(StorieModel) get setMLikedStorieTapped =>
      _mLikedStorieTapped.sink.add;
  Function(StorieModel) get setMViewedStorieTapped =>
      _mViewedStorieTapped.sink.add;
  Function(List<StorieModel>) get setLikedStories => _mostLikedStories.sink.add;
  Function(List<StorieModel>) get setViewedStories =>
      _mostViewedStories.sink.add;
  Function(int) get setMostViewedCurrPage => _mostViewedCurrPage.sink.add;
  Function(List<StorieModel>) get setRecentPopularStories =>
      _recentPopularStories.sink.add;
  Function(int) get setRecentPopCurrPage => _recentPopularCurrPage.sink.add;

  // loadWelcome() async {
  //   List<StorieModel> mostLikedStories =
  //       await _repository.fetchStoriesLazy("", 0, "mostLiked", false);
  //   setLikedStories(mostLikedStories.toList());
  //   List<StorieModel> mostViewedStories =
  //       await _repository.fetchStoriesLazy("", 0, "mostViewed", false);
  //   setViewedStories(mostViewedStories.toList());
  //   await setMLikedStorieTapped(mostLikedStories[0]);
  //   await setMViewedStorieTapped(mostViewedStories[0]);
  // }

  loadMostLiked() async {
    List<StorieModel> mostLikedStories =
        await _repository.fetchStoriesLazy("", 0, "mostLiked", false, "");
    setLikedStories(mostLikedStories.toList());
    await setMLikedStorieTapped(mostLikedStories[0]);
  }

  loadMostViewed() async {
    List<StorieModel> mostViewedStories =
        await _repository.fetchStoriesLazy("", 0, "mostViewed", false, "");
    setViewedStories(mostViewedStories.toList());
    await setMViewedStorieTapped(mostViewedStories[0]);
    await setMostViewedCurrPage(0);
  }

  loadRecentPopular() async {
    List<StorieModel> mostRecentPopStories =
        await _repository.fetchStoriesLazy("", 0, "mostViewed", true, "");
    setRecentPopularStories(mostRecentPopStories.toList());
    await setRecentPopCurrPage(0);
  }

  dispose() {
    _mLikedStorieTapped.close();
    _mostLikedStories.close();
    _mostViewedStories.close();
    _mViewedStorieTapped.close();
    _mostViewedCurrPage.close();
    _recentPopularStories.close();
    _recentPopularCurrPage.close();
  }
}
