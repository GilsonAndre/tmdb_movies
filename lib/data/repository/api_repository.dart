import 'package:dio/dio.dart';

import '../models/movies_models.dart';

class ApiRepository {
  final dio = Dio();

  Future<List<MoviesModels>> getMovies(String key) async {
    final response = await dio.get(key, queryParameters: {
      'api_key': 'fcbd2848e04db52bc7b9eaa897532e38',
      'language': 'pt-BR',
      'page': '1'
    });

    final List<dynamic> results = response.data['results'];
    final List<MoviesModels> movies =
        results.map((map) => MoviesModels.fromMap(map)).toList();
    return movies;
  }
}
