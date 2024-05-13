import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_full_learn/showTrack/models/movies_model.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';

class ApiMovies {
  
  static String buildDetailsUrl(String arananDeger) {
    
   // return 'https://api.themoviedb.org/3/search/movie?query=$arananDeger&api_key=${Constants.apiKey}';
   // return 'https://api.themoviedb.org/3/search/tv?query=$arananDeger&api_key=950b3e20a26d3c5ec5b4a633ae633ca0';
    return 'https://api.themoviedb.org/3/search/multi?query=$arananDeger&include_adult=false&language=en-US&page=1&api_key=${Constants.apiKey}';
  }

  Future<List<MoviesTMDB>> getDetailMovies(String arananDeger) async {
    final detailsUrl = buildDetailsUrl(arananDeger);
    final response = await http.get(Uri.parse(detailsUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
    // print(decodedData);
    //  print(decodedData.map((movie) => MoviesTMDB.fromJson(movie)).toList());
      return decodedData.map((movie) => MoviesTMDB.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong123 ');
    }
  }
}