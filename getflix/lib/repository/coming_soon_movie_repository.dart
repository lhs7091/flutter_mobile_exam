import 'dart:convert';

import 'package:getflix/export.dart';
import 'package:getflix/service_key.dart';
import 'package:http/http.dart' as http;

class ComingSoonMovieRepository {
  var queryParam = {'api_key': api_key};

  Future<List<ComingSoonMovie>> loadComingSoonMovieList() async {
    var uri = Uri.https('api.themoviedb.org', '/3/movie/upcoming', queryParam);

    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map((item) => ComingSoonMovie.fromJson(item)).toList();
      }
    }
  }
}
