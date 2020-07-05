import 'package:flutter/foundation.dart';
import 'package:http_error/api_services/hacker_news.dart';
import 'package:http_error/model/story.dart';

class StoryViewModel with ChangeNotifier {
  Story _story;

  Story get story => _story;

  Future<void> getStory() async {
    try {
      _story = await HackerNews().getStory();
      print(_story);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
