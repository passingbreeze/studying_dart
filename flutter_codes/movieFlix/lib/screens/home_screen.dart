import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';
import 'package:movieflix/widgets/movie_widget.dart';
import 'package:movieflix/widgets/pop_movie_widget.dart';

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
