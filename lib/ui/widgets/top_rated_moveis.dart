import 'package:flutter/material.dart';
import 'package:tmdb_movies/data/models/movies_models.dart';
import 'package:tmdb_movies/data/repository/api_repository.dart';

const apiKeyTopRated = 'https://api.themoviedb.org/3/movie/top_rated?';

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
            child: Text('Filmes Melhor Avaliados'),
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
                        onTap: () {},
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(itens[index].backdropPath),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: Text(itens[index].title),
                              )
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
