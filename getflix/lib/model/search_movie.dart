class SearchMovie {
  int id;
  String title;
  String posterPath;
  String overview;
  String backdropPath;
  String name;

  SearchMovie(
      {this.id,
      this.title,
      this.posterPath,
      this.overview,
      this.backdropPath,
      this.name});

  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    return SearchMovie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String,
      name: json['name'] as String,
    );
  }
}
