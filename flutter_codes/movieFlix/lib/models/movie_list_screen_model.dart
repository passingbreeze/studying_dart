class MovieModel {
  final String posterPath;
  MovieModel.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'];
}
