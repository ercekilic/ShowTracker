import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/models/movies_model.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';

class CardDesign extends StatelessWidget {
  final MoviesTMDB movie;
  const CardDesign({
    super.key, required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.orange,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
                child: movie.posterPath != ""
                    ? Image.network(
                        '${Constants.imagePath}${movie.posterPath}',
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(
                        child: Placeholder(),
                      )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${movie.title} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movie.releaseDate,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
