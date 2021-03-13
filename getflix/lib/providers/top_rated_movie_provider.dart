import 'package:flutter/material.dart';
import 'package:getflix/model/top_rated_movie.dart';
import 'package:getflix/repository/top_rated_movie_repository.dart';

class TopRatedMovieProvider extends ChangeNotifier {
  TopRatedMovieRepository _topRatedMovieRepository = TopRatedMovieRepository();

  List<TopRatedMovie> _topRatedMoiveList = [];

  List<TopRatedMovie> getTopRatedMovieList() => _topRatedMoiveList;

  loadTopRatedMovieList() async {
    List<TopRatedMovie> topRatedMoiveList =
        await _topRatedMovieRepository.loadTopRatedMovieList();
    _topRatedMoiveList = topRatedMoiveList;
    notifyListeners();
  }
}
