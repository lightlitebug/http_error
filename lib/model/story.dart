class Story {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  Story({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      by: json['by'],
      descendants: json['descendants'],
      id: json['id'],
      kids: json['kids'].cast<int>(),
      score: json['score'],
      time: json['time'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'by': by,
      'descendants': descendants,
      'id': id,
      'kids': kids,
      'score': score,
      'time': time,
      'title': title,
      'type': type,
      'url': url,
    };
  }
}
