import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_screen_model.dart';
import 'package:movieflix/models/movie_model.dart';

const String baseURL = "https://movies-api.nomadcoders.workers.dev";

class ApiService {
  static Future<List<MovieModel>> getPosters(String endpoint) async {
    List<MovieModel> moviePosters = [];
    final url = Uri.parse("$baseURL/$endpoint");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      // print(movies);
      for (var movie in movies['results']) {
        final jsonData = MovieModel.fromJson(movie);
        moviePosters.add(jsonData);
      }
      return moviePosters;
    }
    // print(response.body);
    throw Error();
  }

  static Future<MovieDetailModel> getDetailedMovie(int id) async {
    final url = Uri.parse("$baseURL/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detailedMovie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(detailedMovie);
    }
    throw Error();
  }
}
