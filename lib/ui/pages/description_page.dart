import 'package:flutter/material.dart';
import 'package:tmdb_movies/ui/widgets/modified_text.dart';

import '../resources/theme.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
    required this.posterPath,
  });
  final String title;
  final String overview;
  final String voteAverage;
  final String backdropPath;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme(),
      home: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ModifiedText(
                      text: '⭐ Nota $voteAverage',
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 16.0),
              child: ModifiedText(
                text: title,
                size: 22,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 250,
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    backdropPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: ModifiedText(
                    text: overview,
                    size: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
