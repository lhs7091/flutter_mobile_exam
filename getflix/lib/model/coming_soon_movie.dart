class ComingSoonMovie {
  int id;
  String title;
  String posterPath;
  String overview;
  String releaseDate;

  ComingSoonMovie(
      {this.id, this.title, this.posterPath, this.overview, this.releaseDate});

  factory ComingSoonMovie.fromJson(Map<String, dynamic> json) {
    return ComingSoonMovie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
    );
  }
}
