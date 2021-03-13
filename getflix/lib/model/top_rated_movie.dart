class TopRatedMovie {
  int id;
  String title;
  String posterPath;
  String overview;

  TopRatedMovie({this.id, this.title, this.posterPath, this.overview});

  factory TopRatedMovie.fromJson(Map<String, dynamic> json) {
    return TopRatedMovie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
    );
  }
}
