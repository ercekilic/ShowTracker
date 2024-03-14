import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';

class ApiMovies {
  
  static String buildDetailsUrl(String arananDeger) {
    return 'https://api.themoviedb.org/3/search/movie?query=$arananDeger&api_key=${Constants.apiKey}';
  }

  Future<List<MoviesTMDB>> getDetailMovies(String arananDeger) async {
    final detailsUrl = buildDetailsUrl(arananDeger);
    final response = await http.get(Uri.parse(detailsUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      print(decodedData.map((movie) => MoviesTMDB.fromJson(movie)).toList());
      return decodedData.map((movie) => MoviesTMDB.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong213 ');
    }
  }
}