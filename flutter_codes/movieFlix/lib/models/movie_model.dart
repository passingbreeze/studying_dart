const String imgURL = "https://image.tmdb.org/t/p/w500/";

class MovieModel {
  final String posterPath, title;
  final int id;
  MovieModel.fromJson(Map<String, dynamic> json)
      : posterPath = imgURL + json['poster_path'],
        title = json['title'],
        id = json['id'];
}
