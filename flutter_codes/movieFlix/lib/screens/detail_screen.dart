import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_screen_model.dart';
import 'package:movieflix/services/api_services.dart';
import 'package:movieflix/widgets/detailed_movie_widget.dart';

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
