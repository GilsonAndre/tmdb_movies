import 'package:flutter/material.dart';
import 'package:tmdb_movies/data/models/movies_models.dart';
import 'package:tmdb_movies/data/repository/api_repository.dart';

const apiKeyPopular = 'https://api.themoviedb.org/3/movie/popular?';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiRepository apiRepository = ApiRepository();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filmes Populares'),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: apiRepository.getMovies(apiKeyPopular),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Ocorreu um erro! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final item = snapshot.data as List<MoviesModels>;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(item[index].backdropPath),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
                                SizedBox(
                                  height: 70,
                                  child: Text(item[index].title),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
