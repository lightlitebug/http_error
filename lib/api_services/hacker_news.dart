import 'dart:convert';

import 'package:http_error/model/story.dart';
import 'package:http/http.dart' as http;

final String url =
    'https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty';

class HackerNews {
  Future<Story> getStory() async {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      return Story.fromJson(responseBody);
    }

    print(
        'Request failed\nStatus: ${response.statusCode}\nReason: ${response.reasonPhrase}');
    throw 'Request failed\nStatus: ${response.statusCode}\nReason: ${response.reasonPhrase}';
  }
}
