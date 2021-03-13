import 'package:flutter/material.dart';
import 'package:getflix/export.dart';

class WeeklyTrendingMovieProvider extends ChangeNotifier {
  WeeklyTrendingRepository _weeklyTrendingRepository =
      WeeklyTrendingRepository();

  List<WeeklyTrendingMovie> _weeklyTrendingMovieList = [];

  List<WeeklyTrendingMovie> getWeeklyTrendingMovie() =>
      _weeklyTrendingMovieList;

  loadWeeklyTrendingMovie() async {
    List<WeeklyTrendingMovie> weeklyTrendingMovieList =
        await _weeklyTrendingRepository.loadWeeklyTrendingMovie();

    _weeklyTrendingMovieList = weeklyTrendingMovieList;
    notifyListeners();
  }
}
