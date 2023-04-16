const String imgURL = "https://image.tmdb.org/t/p/w500/";

class Genres {
  final String name;
  final int id;

  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String;
}

class MovieDetailModel {
  final String posterPath;
  final List<Genres> genres;
  final String title;
  final String overView;
  final int runTime;
  final double voteAvg;
  final int voteCnt;

  MovieDetailModel({
    required this.posterPath,
    required this.genres,
    required this.title,
    required this.overView,
    required this.runTime,
    required this.voteAvg,
    required this.voteCnt,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    List<Genres> genreList = [];
    for (var g in json['genres']) {
      genreList.add(Genres.fromJson(g));
    }

    return MovieDetailModel(
      posterPath: imgURL + json['poster_path'],
      genres: genreList,
      title: json['title'] as String,
      overView: json['overview'] as String,
      runTime: json['runtime'] as int,
      voteAvg: json['vote_average'] as double,
      voteCnt: json['vote_count'] as int,
    );
  }

  String getPosterPath() {
    return posterPath;
  }
}
