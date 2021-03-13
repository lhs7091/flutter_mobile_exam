import 'dart:convert';

import 'package:getflix/export.dart';
import 'package:getflix/service_key.dart';
import 'package:http/http.dart' as http;

class TopRatedMovieRepository {
  var queryParam = {'api_key': api_key};

  Future<List<TopRatedMovie>> loadTopRatedMovieList() async {
    var uri = Uri.https('api.themoviedb.org', '/3/movie/top_rated', queryParam);
    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);

      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list
            .map<TopRatedMovie>((item) => TopRatedMovie.fromJson(item))
            .toList();
      }
    }
  }
}
