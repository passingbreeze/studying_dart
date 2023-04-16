import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:movieflix/models/movie_detail_screen_model.dart';

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
