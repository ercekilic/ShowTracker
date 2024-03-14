import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/film.dart';

class MyMoviesProvider extends ChangeNotifier {
  
  List<Film> _films = [];
  List<Film> get films => _films;


  void addFilm(Film film) {
    final isExist = _films.contains(film);
    if (!isExist) {
      _films.add(film);
      notifyListeners();
    }
  }

  void dellFilm(Film film) {
    _films.remove(film);
    notifyListeners();
  }
}

