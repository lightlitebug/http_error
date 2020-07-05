import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_error/view_model/story_view.model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _getStory();
  }

  _showErrorDialog(e) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
          actions: <Widget>[
            FlatButton(
              child: Text('Try Again'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _getStory() async {
    try {
      setState(() => loading = true);

      await Provider.of<StoryViewModel>(context, listen: false).getStory();

      setState(() => loading = false);
    } on SocketException catch (_) {
      _showErrorDialog('Connection Error, Check Your Internet Connection');
    } catch (e) {
      setState(() => loading = false);
      print(e);
      _showErrorDialog(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoryViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Http Error Handling'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : vm.story == null
              ? Center(child: LargeText('No Story'))
              : ListView(
                  children: <Widget>[
                    LargeText('by: ${vm.story.by}'),
                    LargeText('descendants: ${vm.story.descendants}'),
                    LargeText('id: ${vm.story.id}'),
                    LargeText('kids: ${vm.story.kids}'),
                    LargeText('score: ${vm.story.score}'),
                    LargeText('time: ${vm.story.time}'),
                    LargeText('title: ${vm.story.title}'),
                    LargeText('type: ${vm.story.type}'),
                    LargeText('url: ${vm.story.url}'),
                  ],
                ),
    );
  }
}

class LargeText extends StatelessWidget {
  final String text;

  const LargeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
