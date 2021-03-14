import 'package:flutter/material.dart';
import 'package:getflix/export.dart';

class SearchMovieProvider extends ChangeNotifier {
  SearchMovieRepository _searchMovieRepository = SearchMovieRepository();

  List<SearchMovie> _searchMovieList = [];

  List<SearchMovie> getSearchMovieList() => _searchMovieList;

  Future<List> loadSearchMovieList(String keyWord) async {
    List<SearchMovie> searchMovieList =
        await _searchMovieRepository.loadSearchMovieList(keyWord);
    _searchMovieList = searchMovieList;

    notifyListeners();

    return _searchMovieList;
  }
}
