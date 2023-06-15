import 'package:flutter/material.dart';
import 'package:tmdb_movies/data/models/movies_models.dart';
import 'package:tmdb_movies/data/repository/api_repository.dart';
import 'package:tmdb_movies/ui/pages/description_page.dart';

import 'modified_text.dart';

const apiKeyTopRated = 'https://api.themoviedb.org/3/movie/top_rated';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    ApiRepository apiRepository = ApiRepository();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: ModifiedText(
              text: 'Filmes Mais Avaliados',
              size: 22,
            ),
          ),

          const SizedBox(height: 10.0,),
          
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: apiRepository.getMovies(apiKeyTopRated),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Ocorreu um erro! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final itens = snapshot.data as List<MoviesModels>;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                title: itens[index].title,
                                overview: itens[index].overview,
                                voteAverage: itens[index].voteAverage,
                                backdropPath: itens[index].backdropPath,
                                posterPath: itens[index].posterPath,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(itens[index].posterPath),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: ModifiedText(
                                  text: itens[index].title,
                                  size: 17,
                                ),
                              ),
                            ],
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
