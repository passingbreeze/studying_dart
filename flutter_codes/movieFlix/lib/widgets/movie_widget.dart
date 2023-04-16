import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

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
