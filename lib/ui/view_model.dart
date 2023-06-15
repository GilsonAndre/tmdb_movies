import 'package:flutter/cupertino.dart';
import 'package:tmdb_movies/data/models/movies_models.dart';
import 'package:tmdb_movies/data/repository/api_repository.dart';

class ViewModel extends ChangeNotifier{
  final ApiRepository _apiRepository = ApiRepository();

  Future<List<MoviesModels>> getMoviesVM(String key) async {
    notifyListeners();
    return _apiRepository.getMovies(key);
    
  }
}
