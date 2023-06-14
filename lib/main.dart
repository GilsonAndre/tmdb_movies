import 'package:flutter/material.dart';
import 'package:tmdb_movies/ui/widgets/popular_movies.dart';
import 'package:tmdb_movies/ui/widgets/top_rated_moveis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filmes tmdb'),
        ),
        body: ListView(
          children: const [
            PopularMovies(),
            TopRated(),
          ],
        ),
      ),
    );
  }
}
