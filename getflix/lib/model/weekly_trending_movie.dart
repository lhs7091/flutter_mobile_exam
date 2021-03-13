class WeeklyTrendingMovie {
  int id;
  String title;
  String posterPath;
  String overview;

  WeeklyTrendingMovie({this.id, this.title, this.posterPath, this.overview});

  factory WeeklyTrendingMovie.fromJson(Map<String, dynamic> json) {
    return WeeklyTrendingMovie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
    );
  }
}
