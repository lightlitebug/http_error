import 'package:flutter/material.dart';

import 'package:http_error/screens/my_home_page.dart';
import 'package:http_error/view_model/story_view.model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StoryViewModel>(
      create: (context) => StoryViewModel(),
      child: MaterialApp(
        title: 'Http Error Handling',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
