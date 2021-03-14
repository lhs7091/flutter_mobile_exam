import 'dart:convert';

import 'package:getflix/export.dart';
import 'package:getflix/service_key.dart';
import 'package:http/http.dart' as http;

class SearchMovieRepository {
  var queryParam = {'api_key': api_key, 'query': ''};

  Future<List<SearchMovie>> loadSearchMovieList(String keyWord) async {
    queryParam['query'] = keyWord;

    var uri = Uri.https('api.themoviedb.org', '/3/search/multi', queryParam);

    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);

      if (body['results'] != null) {
        List<dynamic> list = body['results'];

        return list.map((item) => SearchMovie.fromJson(item)).toList();
      } else {
        return null;
      }
    }
  }
}
