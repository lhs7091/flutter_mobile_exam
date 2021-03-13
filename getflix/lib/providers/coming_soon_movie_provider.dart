import 'package:flutter/material.dart';
import 'package:getflix/export.dart';

class ComingSoonMovieProvider extends ChangeNotifier {
  ComingSoonMovieRepository _comingSoonMovieRepository =
      ComingSoonMovieRepository();

  List<ComingSoonMovie> _comingSoonMovieList = [];

  List<ComingSoonMovie> getComingSoonMovieList() => _comingSoonMovieList;

  loadComingSoonMovie() async {
    List<ComingSoonMovie> comingSoonMovieList =
        await _comingSoonMovieRepository.loadComingSoonMovieList();

    _comingSoonMovieList = comingSoonMovieList;
    notifyListeners();
  }
}
