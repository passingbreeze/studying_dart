class Genres {
  final int id;
  final String name;

  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class MovieDetailModel {
  final bool isAdult;
  final String posterPath;
  final List<Genres> genres;
  final String title;
  final String overView;
  final double runTime;
  final double voteAvg;
  final int voteCnt;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : isAdult = json['adult'],
        posterPath = json['poster_path'],
        genres = json['genre_ids'],
        title = json['title'],
        overView = json['overview'],
        runTime = json['runtime'],
        voteAvg = json['vote_average'],
        voteCnt = json['vote_count'];
}
