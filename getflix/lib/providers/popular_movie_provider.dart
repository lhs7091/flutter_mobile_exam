import 'package:flutter/material.dart';
import 'package:getflix/export.dart';

class PopularMovieProvider extends ChangeNotifier {
  PopularMovieRepository _popularMovieRepository = PopularMovieRepository();

  List<PopularMovie> _popularMovieList = [];

  List<PopularMovie> getPopularMovieList() => _popularMovieList;

  loadPopularMovieList() async {
    List<PopularMovie> popularMovieList =
        await _popularMovieRepository.loadMovieList();
    _popularMovieList = popularMovieList;

    notifyListeners();
  }
}
