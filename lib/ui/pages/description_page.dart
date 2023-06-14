import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
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
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text('⭐ Nota $voteAverage', style: const TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(title),
            ),
            Row(
              children: [
                Container(
                  height: 250,
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(backdropPath),
                ),
                Flexible(child: Text(overview)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

