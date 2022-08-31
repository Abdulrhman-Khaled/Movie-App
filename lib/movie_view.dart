import "package:flutter/material.dart";

import 'movie.dart';

class MovieView extends StatelessWidget {
  Movie movie;

  MovieView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Flexible(flex: 1, fit: FlexFit.loose, child: Image.network(movie.imageUrl)),
        ListTile(
          title: Text(movie.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(movie.id.toString(),
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0)),
          trailing: const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        )
      ]),
    );
  }
}
