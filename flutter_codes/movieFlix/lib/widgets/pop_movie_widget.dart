import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

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
