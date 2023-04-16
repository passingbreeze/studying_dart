import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_native/flutter_rating_native.dart';

const String baseURL = "https://movies-api.nomadcoders.workers.dev";
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

class MovieModel {
  final String posterPath, title;
  final int id;
  MovieModel.fromJson(Map<String, dynamic> json)
      : posterPath = imgURL + json['poster_path'],
        title = json['title'],
        id = json['id'];
}

class DetailedMovie extends StatelessWidget {
  final List<Genres> genres;
  final String posterPath;
  final String title;
  final String overView;
  final int runTime;
  final double voteAvg;
  final int voteCnt;

  const DetailedMovie({
    super.key,
    required this.genres,
    required this.title,
    required this.posterPath,
    required this.overView,
    required this.runTime,
    required this.voteAvg,
    required this.voteCnt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken),
          fit: BoxFit.cover,
          image: NetworkImage(posterPath),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${runTime ~/ 60}h ${runTime % 60}m | ${[
                    for (var g in genres) g.name
                  ].toString().replaceAll("[", "").replaceAll("]", "")}",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            FlutterRating(
              rating: voteAvg / 2,
              starCount: 5,
              size: 40,
              color: Colors.amber,
              allowHalfRating: true,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              overView,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopMovie extends StatelessWidget {
  final String posterPath;
  final int id;

  const PopMovie({
    super.key,
    required this.posterPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: "popmovie$id",
            child: Container(
              width: 300,
              height: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                posterPath,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final int id;
  late final Future<MovieDetailModel> detailedMovie;
  MovieDetailScreen({super.key, required this.id}) {
    detailedMovie = ApiService.getDetailedMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'Back to List',
          textAlign: TextAlign.left,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: detailedMovie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DetailedMovie(
                genres: snapshot.data!.genres,
                title: snapshot.data!.title,
                posterPath: snapshot.data!.posterPath,
                runTime: snapshot.data!.runTime,
                overView: snapshot.data!.overView,
                voteAvg: snapshot.data!.voteAvg,
                voteCnt: snapshot.data!.voteCnt);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final popMovies = ApiService.getPosters("popular");
  final nowMovies = ApiService.getPosters("now-playing");
  final soonMovies = ApiService.getPosters("coming-soon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 2, 5, 41),
      appBar: AppBar(
        title: const Text(
          "MovieFlix",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color.fromARGB(115, 2, 5, 41),
        foregroundColor: const Color.fromARGB(255, 243, 52, 39),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular Movies",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: popMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(child: makePopList(snapshot));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const Text(
            "Now in Cinemas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: nowMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(child: makeList(snapshot));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const Text(
            "Coming Soon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: soonMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(child: makeList(snapshot));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    itemBuilder: (context, index) {
      var poster = snapshot.data![index];
      return Movie(
        title: poster.title,
        posterPath: poster.posterPath,
        id: poster.id,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 10,
    ),
  );
}

ListView makePopList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    itemBuilder: (context, index) {
      var poster = snapshot.data![index];
      return PopMovie(
        posterPath: poster.posterPath,
        id: poster.id,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 10,
    ),
  );
}

class Movie extends StatelessWidget {
  final String title, posterPath;
  final int id;
  static int count = 0;

  const Movie({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: "movie_${count++}_$id",
            child: Container(
              width: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(posterPath),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                overflow: TextOverflow.fade,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

void main() {
  runApp(const MovieFlix());
}

class MovieFlix extends StatelessWidget {
  const MovieFlix({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
