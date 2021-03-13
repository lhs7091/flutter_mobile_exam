class PopularMovie {
  int id;
  String title;
  String posterPath;
  String overview;

  PopularMovie({this.id, this.title, this.posterPath, this.overview});

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
    );
  }
}
